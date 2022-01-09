package ga.udada.udada.member;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
	
	private final MemberService memberService;
	private final PasswordEncoder passwordEncoder;
	
	@PostMapping("/findPw")
	public String findPw(String mEmail, RedirectAttributes rttr) throws Exception {
		
		MemberDTO memberDTO = memberService.findMEmail(mEmail);
		
		if(memberDTO!=null) {//일치하는 이메일이 있을 경우
			String mPw = UUID.randomUUID().toString().replace("-", "");//임시 비밀번호 발급
			mPw = mPw.substring(0,10);
			
			//System.out.println("임시비밀번호:"+mPw);
			
			memberDTO.setMPw(mPw);
			
			MailUtil mail = new MailUtil();
			mail.sendMail(memberDTO);
			
			mPw = passwordEncoder.encode(mPw);
			memberDTO.setMPw(mPw);

			memberService.updatePwd(memberDTO);//임시 비밀번호로 변경
			
			rttr.addFlashAttribute("msg", "가입하신 이메일로 임시 비밀번호가 발급되었습니다.");
			return "redirect:/member/login";
		}else{
		
			rttr.addFlashAttribute("msg", "가입된 이메일이 없습니다. 다시 한번 확인해주시기 바랍니다.");
		}
		return "redirect:/member/findPw";
	}
	
	@GetMapping("/findPw")
	public void findPw() {
		
	}

	@GetMapping("/deleteWeight")
	public String deleteWeight(int msNo, RedirectAttributes rttr) {
		memberService.deleteWeight(msNo);
		rttr.addFlashAttribute("msg", "삭제되었습니다.");
		return "redirect:/member/myWeight";
	}
	
	@PostMapping("/insertWeight")
	public String insertWeight(MemberSpecDTO memberSpecDTO, Model model, RedirectAttributes rttr, Authentication auth) {
		String mEmail = auth.getName();
		memberSpecDTO.setMEmail(mEmail);
		memberService.insertWeight(memberSpecDTO);
		rttr.addFlashAttribute("msg", "체중이 등록되었습니다.");
		return "redirect:/member/myWeight";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myWeight")
	public void myWeight(MemberSpecDTO memberSpecDTO, Model model, PageRequestDTO pageRequestDTO, Authentication auth)  throws Exception {//체중재기 클릭했을 때
		
		String mEmail = auth.getName();
		
		//------------------------체중 등록 창에 현재 체중 출력 start
		memberSpecDTO = memberService.currentMyWeight(mEmail);

		model.addAttribute("dto", memberSpecDTO);
		//------------------------체중 등록 창에 현재 체중 출력 end
		
		//------------------------체중 기록 리스트 출력 & 페이징 start
		
		int pageNum = pageRequestDTO.getPageNum();
		int pageSize = pageRequestDTO.getPageSize();
		List<MemberSpecDTO> list = memberService.getMyWeightAndPaging(pageNum, pageSize, mEmail);

		model.addAttribute("list", list);

		int total = memberService.countAll(pageNum, pageSize, mEmail);
		pageRequestDTO.setPageNum(pageNum);
		pageRequestDTO.setPageSize(pageSize);
		model.addAttribute("pageResultDTO", new PageResultDTO(pageRequestDTO, total));
		
		//------------------------체중 기록 리스트 출력 & 페이징 end
		
		//------------------------체중 기록 차트 start
		
		List<MemberSpecDTO> mylist = memberService.selectMyWeight(mEmail); //내 체중 리스트 가져오기
		Gson gson = new Gson();

		JsonArray jArray = new JsonArray();
		
		Iterator<MemberSpecDTO> it = mylist.iterator();
		while(it.hasNext()) {
			MemberSpecDTO specDTO = it.next();
			JsonObject object = new JsonObject();
			
			Double msWeight = specDTO.getMsWeight();
			Double msGoal = specDTO.getMsGoal();
			String msDateStr = specDTO.getMsDateStr();
			
			//System.out.println("msWeight:"+msWeight+"/ msGoal:"+msGoal+"/ msDateStr:"+msDateStr);
			
			object.addProperty("msWeight", msWeight);
			object.addProperty("msGoal", msGoal);
			object.addProperty("msDateStr", msDateStr.substring(6));
			jArray.add(object);
		}
		
		String json = gson.toJson(jArray);
		model.addAttribute("json", json);
	}//myWeight() end
	
	
	
	@PostMapping("/leave")
	public String leave(MemberDTO memberDTO, RedirectAttributes rttr) {
		memberDTO.setMGrade("CLOSE");
		memberService.leave(memberDTO);
		SecurityContextHolder.clearContext();
		rttr.addFlashAttribute("msg", "탈퇴되었습니다.");
		return "redirect:/member/login";
	}

	@PostMapping("/updateMyProfile")
	public String updateMyProfile(MemberDTO memberDTO, Model model, String mBirthStr, RedirectAttributes rttr) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			memberDTO.setMBirth(sdf.parse(mBirthStr));
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		
		System.out.println("입력한 비밀번호:"+memberDTO.getMPw());
		
		if(memberDTO.getMPw()!=null && memberDTO.getMPw().trim().length()!=0) {//새 비밀번호를 입력한 경우
			
			System.out.println("새비밀번호 입력함");

			memberService.updateMyProfile(memberDTO);
			
		}else if(memberDTO.getMPw().equals("")){//새 비밀번호를 입력하지 않은 경우
			
			System.out.println("새비밀번호 입력하지않음");

			memberService.updateMyProfileWithoutPwd(memberDTO);
		}
		
		rttr.addFlashAttribute("msg", "회원정보가 수정되었습니다.");
		return "redirect:/";
	}
	

	@GetMapping("/myProfile")
	public void myProfile(String mEmail, Model model, Authentication auth) {
		
		mEmail = auth.getName();
		//log.info("myProfile:"+mEmail);
		MemberDTO memberDTO = memberService.myProfile(mEmail);
		model.addAttribute("dto", memberDTO);
	}
	

	@PostMapping("/pwdCheck")
	public String pwdCheck(MemberDTO memberDTO, RedirectAttributes rttr, Authentication auth) {
		//memberDTO.setMEmail(auth.getName());
		String mPw = memberDTO.getMPw();
		//System.out.println("입력한 비밀번호: "+mPw);
				
		String mEmail = auth.getName();
		
		//int result = memberService.pwdCheck(memberDTO);
		memberDTO = memberService.pwdCheck(mEmail);
		String encodedPwd = memberDTO.getMPw();
		//System.out.println("저장된 비밀번호: "+encodedPwd);
		if(passwordEncoder.matches(mPw, encodedPwd)) {
			//System.out.println("비밀번호 일치함");
			return "redirect:/member/myProfile";
		}else {
			rttr.addFlashAttribute("msg", "비밀번호를 다시 입력해주세요.");
			return "redirect:/member/pwdCheck";
		}
	}

	@GetMapping("/pwdCheck")
	public void pwdCheck(String mEmail, Authentication auth) {//프로필 클릭했을 때
		//System.out.println("get");
		mEmail = auth.getName();
		
	}	
	 
	
	@PostMapping("/joinForm_step2")
	public String joinForm_step2(MemberSpecDTO memberSpecDTO, RedirectAttributes rttr) {
		memberService.joinStep2(memberSpecDTO);
		rttr.addFlashAttribute("msg", "가입되었습니다.");
		return "redirect:/member/login";
	}
	
	@GetMapping("/joinForm_step2")
	public void joinForm_step2(MemberDTO memberDTO, Model model) {
		model.addAttribute("mEmail", memberDTO.getMEmail());
	}
	
	@ResponseBody
	@PostMapping("/emailChk")
	public ResponseEntity<String> emilChk(String mEmail) throws Exception{
		int result = memberService.duplecateEmail(mEmail);
		String msg = "";
		if(result == 0) msg="success";
		else msg="fail";
		return new ResponseEntity<>(msg,HttpStatus.OK);
	}
	
	@PostMapping("/emailCheckProc")
	public String emailCheckProc(MemberDTO memberDTO, Model model, String mBirthStr) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			memberDTO.setMBirth(sdf.parse(mBirthStr));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		memberService.join(memberDTO);
		model.addAttribute("mEmail", memberDTO.getMEmail());
		return "redirect:/member/joinForm_step2";
	}
	
	@GetMapping("/login")
	public void login(String error, String logout, Model model, Authentication auth) {
		
		
		if(error!=null) {
			model.addAttribute("error","아이디와 패스워드를 확인해주십시오.");
		}
		if(logout!=null) {
			model.addAttribute("logout","로그아웃 되었습니다.");
		}
		
	}
	
	@GetMapping("/joinForm")
	public void joinForm() {
		
	}
	
}
