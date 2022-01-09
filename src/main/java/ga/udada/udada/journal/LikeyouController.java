package ga.udada.udada.journal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor

@RequestMapping("/likeyou")
public class LikeyouController {

	private final LikeyouService likeyouService;
	
	//@PreAuthorize("authentication.principal.username == #journalDTO.mEmail or hasRole('ROLE_ADMIN')")
	@ResponseBody
	@PostMapping("/insertLike")
	public int insertLike(Long jNo, String mEmail) throws Exception{
		
		int heart = likeyouService.getLike(jNo, mEmail);

        System.out.println("likeyouheart :"+heart);

        if(heart >= 1) {
        	likeyouService.deleteLike(jNo, mEmail);
            heart=0;
            System.out.println("좋아요 취소");
        } else {
        	likeyouService.insertLike(jNo, mEmail);
            heart=1;
            System.out.println("좋아요");
        }

		return heart;
	}

}
