package ga.udada.udada.reply;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor

@RequestMapping("/reply")
public class ReplyController {
	
	private final ReplyService replyService;
	
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	@PostMapping("/replyinsert") //댓글 등록
	public int insertReply(String reContent, Long oriNo, String mEmail, String reDiv) {
	
		int result = 0;
		try {
			result = replyService.insertReply(reContent, oriNo, mEmail, reDiv);
		}catch(Exception e) {
			System.out.println("댓글 실패 :" +e);
			result = 2;
		}
		return result;
	}
	
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	@PostMapping("/commentinsert")
	public int commentinsert(String reContent, Long oriNo, String mEmail, String reDiv, int reGroup) {
	
		int result = 0;
		try {
			result = replyService.commentinsert(reContent, oriNo, mEmail, reDiv, reGroup);
		}catch(Exception e) {
			System.out.println("댓글 실패 :" +e);
			result = 2;
		}
		return result;
	}
	
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	@PostMapping("/replyDelete")
	public int deleteReply(Long reNo, int commentCheck) {
		
		int result = 0;
		try {
			result = replyService.deleteReply(reNo, commentCheck);
		}catch(Exception e) {
			System.out.println("댓글 삭제 실패 :" +e);
			result = 2;
		}
		return result;
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@ResponseBody
	@PostMapping("/replyModify")
	public void replyModify(String reContent, Long reNo) throws Exception{
		
		replyService.replyModify(reContent, reNo);
		
	}
	
}
