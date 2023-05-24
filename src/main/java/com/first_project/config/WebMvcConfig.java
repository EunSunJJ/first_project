package com.first_project.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.first_project.util.FileManagerService;

@Configuration  // 설정을 위한 spring bean
public class WebMvcConfig implements WebMvcConfigurer {
	
	// 서버에 업로드 된 이미지와 웹 이미지 주소와의 매핑 설정
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**")
		// 웹 이미지주소 -> /images/hellohi_1684494435848/chipmunk-3959206__340.jpg
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);  
		// 실제 파일 위치 , window인 경우 슬래시 3개

	
	}
}
