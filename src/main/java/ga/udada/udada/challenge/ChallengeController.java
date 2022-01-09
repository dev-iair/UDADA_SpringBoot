package ga.udada.udada.challenge;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/challenge")
public class ChallengeController {

	private final ChallengeService challengeService;

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(ChallengeDTO challengeDTO, ChallengeGoalDTO challengeGoalDTO, String cPeriod,
			Long[] eNoArray, Long[] cgTimeArray) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (cPeriod.length() < 13) {
			try {
				challengeDTO.setCFinish(sdf.parse(cPeriod));
				challengeDTO.setCStart(sdf.parse(cPeriod));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			try {
				challengeDTO.setCStart(sdf.parse(cPeriod.substring(0, 10)));
				challengeDTO.setCFinish(sdf.parse(cPeriod.substring(13)));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		challengeService.register(challengeDTO);
		challengeService.registerApply(challengeDTO);
		Long cNo = challengeDTO.getCNo();
		challengeGoalDTO.setCNo(cNo);
		for (int i = 0; i < eNoArray.length; i++) {
			if (eNoArray[i] != null) {
				challengeGoalDTO.setENo(eNoArray[i]);
				challengeGoalDTO.setCgTime(cgTimeArray[i]);
				challengeService.registerGoal(challengeGoalDTO);
			} else
				continue;
		}
		return "redirect:/challenge/read/" + cNo + "";
	}

	@RequestMapping("/list")
	public void loadList(Model model, ChallengeGetListDTO challengeGetListDTO) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (challengeGetListDTO.getPageNo() == null) {
			challengeGetListDTO.setPageNo((double) 1);
		}
		if (challengeGetListDTO.getExercise() != null && challengeGetListDTO.getExercise() != "") {
			int[] excsList = challengeService.eNameSearch(challengeGetListDTO.getExercise());
			if (excsList.length < 1) {
				excsList = new int[] { 0 };
			}
			challengeGetListDTO.setExcsResult(excsList);
		}
		challengeGetListDTO.setStartNo((long) (9 * (challengeGetListDTO.getPageNo() - 1) + 1));
		challengeGetListDTO.setEndNo((long) (9 * challengeGetListDTO.getPageNo()));
		String pDate = challengeGetListDTO.getPeriod();
		if (pDate != null && pDate != "") {
			if (pDate.length() < 13) {
				try {
					challengeGetListDTO.setStart(sdf.parse(pDate));
					challengeGetListDTO.setFinish(sdf.parse(pDate));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			} else {
				try {
					challengeGetListDTO.setStart(sdf.parse(pDate.substring(0, 10)));
					challengeGetListDTO.setFinish(sdf.parse(pDate.substring(13)));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		List<ChallengeListDTO> list = challengeService.loadList(challengeGetListDTO);
		Double challengAmount = (double) challengeService.getListSize(challengeGetListDTO);
		challengeGetListDTO.setEndPage(Math.ceil(challengAmount / 9));
		challengeGetListDTO.setStartPage((Math.ceil(challengeGetListDTO.getPageNo() / 5) - 1) * 5 + 1);
		Boolean checkEnd;
		if ((Math.ceil(challengeGetListDTO.getPageNo() / 5) < Math.ceil(challengeGetListDTO.getEndPage() / 5))) {
			checkEnd = true;
		} else {
			checkEnd = false;
		}
		Date nowDate = new Date();
		for (int i = 0; i < list.size(); i++) {
			Long cNo;
			cNo = list.get(i).getCNo();
			List<ChallengeGlistDTO> gList = challengeService.loadGlist(cNo);
			list.get(i).setGList(gList);
		}
		for (int i = 0; i < list.size(); i++) {
			Date chgDate = list.get(i).getCStart();
			if (nowDate.before(chgDate)) {
				list.get(i).setCIng("primary");
			} else {
				list.get(i).setCIng("warning");
			}
		}

		model.addAttribute("page", challengeGetListDTO);
		model.addAttribute("list", list);
		model.addAttribute("checkEnd", checkEnd);
	}

	@RequestMapping("/read/{cNo}")
	public String read(Model model, @PathVariable Long cNo) {

		model.addAttribute("dto", challengeService.read(cNo));
		model.addAttribute("goal", challengeService.readGoal(cNo));

		return "challenge/read";
	}


	@ResponseBody
	@PostMapping("/apply")
	public Boolean apply(Long cNo, String sEmail) {
		Boolean apply = challengeService.challengeApply(cNo, sEmail);
		return apply;
	}

	@ResponseBody
	@PostMapping("/cancel")
	public Boolean cancel(Long cNo, String sEmail) {
		Boolean cancel = challengeService.challengeCancel(cNo, sEmail);
		return cancel;
	}

	@ResponseBody
	@PostMapping("/applyCheck")
	public int applyCheck(Long cNo, String sEmail) {
		int applyCheck = challengeService.applyCheck(sEmail, cNo);
		return applyCheck;
	}

	@PostMapping("/edit")
	public String edit(Model model, Long cNo) {
		model.addAttribute("dto", challengeService.read(cNo));
		model.addAttribute("goal", challengeService.readGoal(cNo));
		return "challenge/modify";
	}

	@PostMapping("/modify")
	public String modify(ChallengeDTO challengeDTO, ChallengeGoalDTO challengeGoalDTO, String cPeriod, Long[] eNoArray,

			Long[] cgTimeArray, Long cNo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (cPeriod.length() < 13) {
			try {
				challengeDTO.setCFinish(sdf.parse(cPeriod));
				challengeDTO.setCStart(sdf.parse(cPeriod));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			try {
				challengeDTO.setCStart(sdf.parse(cPeriod.substring(0, 10)));
				challengeDTO.setCFinish(sdf.parse(cPeriod.substring(13)));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		challengeService.modify(challengeDTO);
		challengeService.delGoal(challengeDTO);
		for (int i = 0; i < eNoArray.length; i++) {
			if (eNoArray[i] != null) {
				challengeGoalDTO.setENo(eNoArray[i]);
				challengeGoalDTO.setCgTime(cgTimeArray[i]);
				challengeService.modifyGoal(challengeGoalDTO);
			} else
				continue;
		}
		return "redirect:/challenge/read/" + cNo + "";
	}

	@PostMapping("/delete")
	public void delete(Long cNo) {
		challengeService.delete(cNo);
	}

	@ResponseBody
	@PostMapping("/searchExcs")
	public List<ChallengeReadGoalDTO> searchExcs(String eName) {
		List<ChallengeReadGoalDTO> list = challengeService.searchExcs(eName);
		return list;
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/mychallenge")
	public void myList(Model model, String sEmail, Authentication auth) {
		sEmail = auth.getName();
		List<MyChallengeProceedDTO> proceedList = challengeService.proceedList(sEmail);
		List<MyChallengeApplyDTO> applyList = challengeService.applyList(sEmail);
		List<MyChallengeEndDTO> endList = challengeService.endList(sEmail);

		for (int i = 0; i < proceedList.size(); i++) {
			Long cNo;
			cNo = proceedList.get(i).getCNo();
			List<ChallengeGlistDTO> gList = challengeService.loadGlist(cNo);
			proceedList.get(i).setGList(gList);
		}
		for (int i = 0; i < applyList.size(); i++) {
			Long cNo;
			cNo = applyList.get(i).getCNo();
			List<ChallengeGlistDTO> gList = challengeService.loadGlist(cNo);
			applyList.get(i).setGList(gList);
		}
		for (int i = 0; i < endList.size(); i++) {
			Long cNo;
			cNo = endList.get(i).getCNo();
			List<ChallengeGlistDTO> gList = challengeService.loadGlist(cNo);
			endList.get(i).setGList(gList);
		}
		model.addAttribute("proceedList", proceedList);
		model.addAttribute("applyList", applyList);
		model.addAttribute("endList", endList);
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/progress/{cNo}")
	public String progress(Model model,@PathVariable Long cNo, Authentication auth) {
		
		MyChallengeInfoDTO myChallengeInfoDTO = challengeService.myChallengeInfo(cNo);
		List<ChallengeReadGoalDTO> readSuccessGoal = challengeService.readSuccessGoal(cNo);
		myChallengeInfoDTO.setGoalList(readSuccessGoal);
		myChallengeInfoDTO.setGoalCnt(readSuccessGoal.size());
		List<MyChallengeSuccessCntMDTO> getMemSuccess = challengeService.getMemSuccess(myChallengeInfoDTO);
		if(myChallengeInfoDTO.getProcDate()>myChallengeInfoDTO.getTotalDate()) {
			myChallengeInfoDTO.setProcDate(myChallengeInfoDTO.getTotalDate());
		}
		List<MyChallengeSuccessCntDDTO> getDaySuccess = challengeService.getDaySuccess(myChallengeInfoDTO);
		int j = 0;
		for(int i=0; i<getMemSuccess.size();i++) {
			j = j + getMemSuccess.get(i).getSuccess();
		}
		myChallengeInfoDTO.setTotalScs(j);
		myChallengeInfoDTO.setMEmail(auth.getName());
		myChallengeInfoDTO.setMySuccess(challengeService.getTodaySuccess(myChallengeInfoDTO));
		
		List<MyChallengeGetTalkDTO> getTalk = challengeService.getTalk(cNo);
		
		for(int i=0;i<getTalk.size();i++) {	
			Long reNo = getTalk.get(i).getReNo();
			List<MyChallengeGetTalkDTO> getTalkReply = challengeService.getTalkReply(reNo);
			getTalk.get(i).setTalkReply(getTalkReply);
		}
		
		int checkMem = challengeService.checkMem(cNo, auth.getName());
		List<ChallengeReadGoalDTO> readGoal = challengeService.readGoal(cNo);
		myChallengeInfoDTO.setGoalList(readGoal);

		model.addAttribute("info", myChallengeInfoDTO);
		model.addAttribute("mem", getMemSuccess);
		model.addAttribute("day", getDaySuccess);
		model.addAttribute("talk", getTalk);
		model.addAttribute("checkMem", checkMem);
		
		return "challenge/progress";

	}
	
	@ResponseBody
	@PostMapping("/talkReg")
	public void talkReg(MyChallengeTalkDTO myChallengeTalkDTO) {
		challengeService.talkReg(myChallengeTalkDTO);  
	}
	
	@ResponseBody
	@PostMapping("/talkDel")
	public void delTalk(int reNo, int checkTalk) {
			challengeService.talkDel(reNo,checkTalk); 
	}
	
	@ResponseBody
	@PostMapping("/talkEdit")
	public void editTalk(int reNo, String reContent) {
		challengeService.editTalk(reNo,reContent);
	}
	
	@ResponseBody
	@PostMapping("/getMySuccessDay")
	public List<MyChallengeGetMySuccessDayDTO> getMySuccessDay(Long cNo, String mEmail) {
 
		MyChallengeInfoDTO myChallengeInfoDTO = challengeService.myChallengeInfo(cNo);
		List<ChallengeReadGoalDTO> readGoal = challengeService.readGoal(cNo);
		myChallengeInfoDTO.setGoalList(readGoal);
		myChallengeInfoDTO.setGoalCnt(readGoal.size());
		myChallengeInfoDTO.setMEmail(mEmail);
		if(myChallengeInfoDTO.getProcDate()>myChallengeInfoDTO.getTotalDate()) {
			myChallengeInfoDTO.setProcDate(myChallengeInfoDTO.getTotalDate());
		}
		  List<MyChallengeGetMySuccessDayDTO> list =
		  challengeService.getMySuccessDay(myChallengeInfoDTO);
		 	 
		return list;
	}
	
	@PreAuthorize("isAuthenticated()")	
	@RequestMapping("/mylist")
	public void loadMyList(Model model, ChallengeGetMyListDTO challengeGetListDTO, Authentication auth) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (challengeGetListDTO.getPageNo() == null) {
			challengeGetListDTO.setPageNo((double) 1);
		}
		if (challengeGetListDTO.getExercise() != null && challengeGetListDTO.getExercise() != "") {
			int[] excsList = challengeService.eNameSearch(challengeGetListDTO.getExercise());
			if (excsList.length < 1) {
				excsList = new int[] { 0 };
			}
			challengeGetListDTO.setExcsResult(excsList);
		}
		challengeGetListDTO.setStartNo((long) (9 * (challengeGetListDTO.getPageNo() - 1) + 1));
		challengeGetListDTO.setEndNo((long) (9 * challengeGetListDTO.getPageNo()));
		String pDate = challengeGetListDTO.getPeriod();
		if (pDate != null && pDate != "") {
			if (pDate.length() < 13) {
				try {
					challengeGetListDTO.setStart(sdf.parse(pDate));
					challengeGetListDTO.setFinish(sdf.parse(pDate));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			} else {
				try {
					challengeGetListDTO.setStart(sdf.parse(pDate.substring(0, 10)));
					challengeGetListDTO.setFinish(sdf.parse(pDate.substring(13)));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		challengeGetListDTO.setMEmail(auth.getName());
		List<ChallengeListDTO> list = challengeService.loadMyList(challengeGetListDTO);
		Double challengAmount = (double) challengeService.getMyListSize(challengeGetListDTO);
		challengeGetListDTO.setEndPage(Math.ceil(challengAmount / 9));
		challengeGetListDTO.setStartPage((Math.ceil(challengeGetListDTO.getPageNo() / 5) - 1) * 5 + 1);
		Boolean checkEnd;
		if ((Math.ceil(challengeGetListDTO.getPageNo() / 5) < Math.ceil(challengeGetListDTO.getEndPage() / 5))) {
			checkEnd = true;
		} else {
			checkEnd = false;
		}
		Date nowDate = new Date();
		for (int i = 0; i < list.size(); i++) {
			Long cNo;
			cNo = list.get(i).getCNo();
			List<ChallengeGlistDTO> gList = challengeService.loadGlist(cNo);
			list.get(i).setGList(gList);
		}
		for (int i = 0; i < list.size(); i++) {
			Date chgDate = list.get(i).getCStart();

			if (nowDate.before(chgDate)) {
				list.get(i).setCIng("primary");
			} else {
				list.get(i).setCIng("warning");
			}
		}
		model.addAttribute("page", challengeGetListDTO);
		model.addAttribute("list", list);
		model.addAttribute("checkEnd", checkEnd);
	}
}
