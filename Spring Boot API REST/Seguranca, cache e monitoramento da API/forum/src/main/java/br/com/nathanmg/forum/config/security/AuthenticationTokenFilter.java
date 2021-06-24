package br.com.nathanmg.forum.config.security;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import br.com.nathanmg.forum.modelo.Usuario;
import br.com.nathanmg.forum.repository.UsuarioRepository;

public class AuthenticationTokenFilter extends OncePerRequestFilter {

	private  TokenService tokenService;	
	private UsuarioRepository repository;
	
	
	public AuthenticationTokenFilter(TokenService tokenService, UsuarioRepository repository) {
		this.tokenService = tokenService;
		this.repository = repository;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		String token = recuperarToken(request);
		boolean valid = tokenService.isTokenValid(token);
		if(valid) {
			authenticateClient(token);
		}
		
		filterChain.doFilter(request, response);
	}

	private void authenticateClient(String token) {
		Long userId = tokenService.getUserId(token);// pegar id do token
		Usuario usuario = repository.findById(userId).get();// recuperar usuario com base no id
		
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(usuario, null, usuario.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);//metodo para considerar se esta autenticado
	}

	private String recuperarToken(HttpServletRequest request) {
		String token = request.getHeader("Authorization");
		if(token == null || token.isEmpty() || !token.startsWith("Bearer ")) {
			//se esta vindo o token, se ele não esta vazio e ele começa com Bearer
			return null;
		}
		
		return token.substring(7, token.length());
	}

}
