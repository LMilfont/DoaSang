package com.wktech.doasang.application.services.test;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.wktech.doasang.application.services.UsuarioService;
import com.wktech.doasang.DoasangApplication;
import com.wktech.doasang.domain.entities.Usuario;
import com.wktech.doasang.domain.repositories.UsuarioRepository;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(classes = DoasangApplication.class)
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class UsuarioServiceTest {

    @Autowired
    private UsuarioService userService;

    @Autowired
    private UsuarioRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    @Test
    public void UsuarioServiceTest() {
    	
        // Arrange
    	Usuario dummyUser = new Usuario();
        dummyUser.setUsername("testUser");
        dummyUser.setPassword("password");

        // Codificando a senha antes de salvar.
        //String encodedPassword = bCryptPasswordEncoder.encode(dummyUser.getPassword());
        //dummyUser.setPassword(encodedPassword);

        // Grava o usuário.
        userService.saveUser(dummyUser);

        // Assert.
        Usuario savedUser = userRepository.findByUsername("testUser");
        assertThat(savedUser).isNotNull();
        assertThat(savedUser.getUsername()).isEqualTo("testUser");
        assertThat(bCryptPasswordEncoder.matches("password", savedUser.getPassword())).isTrue();
    }
}