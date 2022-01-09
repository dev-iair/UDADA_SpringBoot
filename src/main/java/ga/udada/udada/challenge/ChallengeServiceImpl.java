package ga.udada.udada.challenge;

import java.util.List;

import ga.udada.udada.mapper.ChallengeMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor

public class ChallengeServiceImpl implements ChallengeService{

	@Autowired
	private ChallengeMapper challengeMapper;


	@Override
	public void register(ChallengeDTO challengeDTO) {	
		challengeMapper.register(challengeDTO);	
	}

	@Override
	public void registerApply(ChallengeDTO challengeDTO) {
		challengeMapper.registerApply(challengeDTO);		
	}

	@Override
	public List<ChallengeListDTO> loadList(ChallengeGetListDTO challengeGetListDTO) {
		return challengeMapper.loadList(challengeGetListDTO);
	}

	@Override
	public List<ChallengeGlistDTO> loadGlist(Long cNo) {
		return challengeMapper.loadGlist(cNo);
	}

	@Override
	public ChallengeReadDTO read(Long cNo) {
		return challengeMapper.read(cNo);
	}

	@Override
	public List<ChallengeReadGoalDTO> readGoal(Long cNo) {
		return challengeMapper.readGoal(cNo);
	
	}

	@Override
	public Boolean challengeApply(Long cNo, String sEmail) {
		return challengeMapper.challengeApply(cNo, sEmail);
	}

	@Override
	public void modify(ChallengeDTO challengeDTO) {
		challengeMapper.modify(challengeDTO);
	}

	@Override
	public void delGoal(ChallengeDTO challengeDTO) {
		challengeMapper.delGoal(challengeDTO);	
	}

	@Override
	public void modifyGoal(ChallengeGoalDTO challengeGoalDTO) {

		challengeMapper.modifyGoal(challengeGoalDTO);
		
	}

	@Override
	public void delete(Long cNo) {
		challengeMapper.delete(cNo);
	}

	@Override
	public List<ChallengeReadGoalDTO> searchExcs(String eName) {
		
		return challengeMapper.searchExcs(eName);
		
	}

	@Override
	public void registerGoal(ChallengeGoalDTO challengeDTO) {
		
		challengeMapper.registerGoal(challengeDTO);
		
	}

	@Override
	public int applyCheck(String sEmail, Long cNo) {

		return challengeMapper.applyCheck(sEmail, cNo);
	}

	@Override
	public Boolean challengeCancel(Long cNo, String sEmail) {
		
		return challengeMapper.challengeCancel(cNo, sEmail);
	}

	@Override
	public int[] eNameSearch(String exercise) {
		return challengeMapper.eNameSearch(exercise);
	}

	@Override
	public List<MyChallengeProceedDTO> proceedList(String sEmail) {
		return challengeMapper.proceedList(sEmail);
	}
	
	@Override
	public List<MyChallengeApplyDTO> applyList(String sEmail) {
		return challengeMapper.applyList(sEmail);
	}
	
	@Override
	public List<MyChallengeEndDTO> endList(String sEmail) {
		return challengeMapper.endList(sEmail);
	}

	@Override
	public MyChallengeInfoDTO myChallengeInfo(Long cNo) {
		return challengeMapper.myChallengeInfo(cNo);
	}

	@Override
	public List<MyChallengeSuccessCntMDTO> getMemSuccess(MyChallengeInfoDTO challengeInfoDTO) {
		return challengeMapper.getMemSuccess(challengeInfoDTO);
	}
	
	@Override
	public List<MyChallengeSuccessCntDDTO> getDaySuccess(MyChallengeInfoDTO challengeInfoDTO) {
		return challengeMapper.getDaySuccess(challengeInfoDTO);
	}

	@Override
	public int getTodaySuccess(MyChallengeInfoDTO challengeInfoDTO) {
		return challengeMapper.getTodaySuccess(challengeInfoDTO);
	}

	@Override
	public void talkReg(MyChallengeTalkDTO myChallengeTalkDTO) {
		challengeMapper.talkReg(myChallengeTalkDTO);
	}

	@Override
	public List<MyChallengeGetTalkDTO> getTalk(Long cNo) {
		return challengeMapper.getTalk(cNo);
	}

	@Override
	public List<MyChallengeGetTalkDTO> getTalkReply(Long reNo) {
		return challengeMapper.getTalkReply(reNo);
	}

	@Override
	public void talkDel(int reNo, int checkTalk) {
		challengeMapper.talkDel(reNo, checkTalk);
	}

	@Override
	public void editTalk(int reNo, String reContent) {
		challengeMapper.editTalk(reNo, reContent);
	}

	@Override
	public List<MyChallengeGetMySuccessDayDTO> getMySuccessDay(MyChallengeInfoDTO myChallengeInfoDTO) {

		return challengeMapper.getMySuccessDay(myChallengeInfoDTO);
	}

	@Override
	public int checkMem(Long cNo, String mEmail) {
		return challengeMapper.checkMem(cNo, mEmail);
	}

	@Override
	public List<ChallengeListDTO> loadMyList(ChallengeGetMyListDTO challengeGetListDTO) {
		return challengeMapper.loadMyList(challengeGetListDTO);
	}

	@Override
	public int getListSize(ChallengeGetListDTO challengeGetListDTO) {
		return challengeMapper.getListSize(challengeGetListDTO);
	}

	@Override
	public int getMyListSize(ChallengeGetMyListDTO challengeGetListDTO) {
		return challengeMapper.getMyListSize(challengeGetListDTO);
	}

	@Override
	public List<ChallengeReadGoalDTO> readSuccessGoal(Long cNo) {
		return challengeMapper.readSuccessGoal(cNo);
	}
	
	

}
