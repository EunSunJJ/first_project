package com.first_project.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {

	// 실제 업로드 된 이미지가 저장될 경로(서버)
	public static final String FILE_UPLOAD_PATH = 
			"C:\\Users\\sunej\\OneDrive\\바탕 화면\\First_project\\spring-tool-suite-4-4.18.1.RELEASE-e4.27.0-win32.win32.x86_64.self-extracting\\workspace\\images/";
	
	// input : MultipartFile (이미지파일) , loginId(이미지가 겹치지 않도록)
	// output : imagePath (String)
	public String saveFile(String loginId, MultipartFile file) {
		// 파일 디렉토리 (= 폴더)
		String directoryName = loginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			return null;		
		}
		
		// 파일 업로드 : byte 단위로 업로드
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			// 디렉토리명 + file.getOriginalFilename은 사용자가 올린 파일명
			// 이름을 만들어 줄 수 있도록 만들어줘야해
			
			Files.write(path, bytes);  // 파일업로드
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		// 파일 업로드가 성공햇으면 이미지 url path를 리턴한다
		//  http://localhost/images/aaa_1678694564/sun.png
		return "/images/" + directoryName + file.getOriginalFilename();
	}
}
