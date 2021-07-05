package br.com.nathanmg.forum.config.swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import br.com.nathanmg.forum.modelo.Usuario;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
public class SwaggerConfiguration {

	@Bean
	public Docket forumApi() {
		return new Docket(DocumentationType.SWAGGER_2)
            .select()
            .apis(RequestHandlerSelectors.basePackage("br.com.nathanmg.forum"))
            .paths(PathSelectors.ant("/**"))
            .build()
            .ignoredParameterTypes(Usuario.class)
            ;
	}
	
}
