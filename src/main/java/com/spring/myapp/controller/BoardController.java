package com.spring.myapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myapp.service.BoardService;
import com.spring.myapp.vo.BoardVO;

@Controller
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService boardService;
	
	@Value("${file.upload.path}")
	private String uploadPath;
	

	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String board(Model model) throws Exception{
		
		return "board";
	}
	
	// 게시물 등록
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert(BoardVO boardVO, @RequestPart("file") MultipartFile file) throws Exception {
		String fileName = file.getOriginalFilename();
		File target = new File(uploadPath, fileName);
		String file_path = target.getPath();
		boardVO.setFile_path(file_path);
		System.out.println(boardVO.getFile_path());
		
		// 경로 생성
        if (!new File(uploadPath).exists()) {
            new File(uploadPath).mkdirs();
        }
        // 파일 복사
        try {
        	FileCopyUtils.copy(file.getBytes(), target);
        } catch(Exception e) {
        	e.printStackTrace();
        }
		
		boardService.insert(boardVO);
		return "redirect:/";
	}
	
	// 게시물 수정
	@RequestMapping(value ="/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		boardService.update(boardVO);
		return "redirect:/";
	}
	
	// 파일 다운로드
	@RequestMapping(value ="/filedownload", method = RequestMethod.GET)
	public void fileDownload(@RequestParam("id") int id, HttpServletResponse response) throws Exception{
		BoardVO vo = boardService.getOneBoard(id);
		
		if (vo.getFile_path() != null && vo.getFile_path().length() != 0) {
			File file = new File(vo.getFile_path());
			String filename = URLEncoder.encode(file.getName(), "UTF-8").replace("+", " ");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
	        response.setHeader("Content-Transfer-Encoding", "binary");
			
	        try {
	        	FileInputStream fis = new FileInputStream(file);
	        	OutputStream out = response.getOutputStream();
	            // 파일 경로를 파라미터로 넣어 inputStream 객체를 만들고 
	            // response에서 파일을 내보낼 OutputStream을 가져와서  
//	        	FileCopyUtils.copy(fis, out);
	            int readCount = 0;
	            byte[] buffer = new byte[1024];
	            // 파일 읽을 만큼 크기의 buffer를 생성한 후 
	            while ((readCount = fis.read(buffer)) != -1) {
	                out.write(buffer, 0, readCount);
	                // outputStream에 씌워준다
	            }
	        } catch (Exception ex) {
	            throw new RuntimeException("file Load Error");
	        }
		}
	}
}