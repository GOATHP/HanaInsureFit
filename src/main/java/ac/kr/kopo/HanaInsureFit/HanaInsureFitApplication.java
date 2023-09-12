package ac.kr.kopo.HanaInsureFit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class HanaInsureFitApplication extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(HanaInsureFitApplication.class);
	}
	public static void main(String[] args) {
		SpringApplication.run(HanaInsureFitApplication.class, args);
	}
}
