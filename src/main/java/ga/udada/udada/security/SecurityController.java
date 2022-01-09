package ga.udada.udada.security;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SecurityController {
	
	@GetMapping("/accessError")
	public void accessError() {
		
	}

}
