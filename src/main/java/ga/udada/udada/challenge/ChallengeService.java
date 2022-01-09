package ga.udada.udada.challenge;

import java.util.List;

public interface ChallengeService {
	
	List<ChallengeListDTO> loadList(ChallengeGetListDTO challengeGetListDTO);
	void register(ChallengeDTO challengeDTO);
	void registerGoal(ChallengeGoalDTO challengeDTO);
	void registerApply(ChallengeDTO challengeDTO);
	List<ChallengeGlistDTO> loadGlist(Long cNo);
	ChallengeReadDTO read(Long cNo);
	List<ChallengeReadGoalDTO> readGoal(Long cNo);
	Boolean challengeApply(Long cNo, String sEmail);
	void modify(ChallengeDTO challengeDTO);
	void delGoal(ChallengeDTO challengeDTO);
	void modifyGoal(ChallengeGoalDTO challengeGoalDTO);
	void delete(Long cNo);
	List<ChallengeReadGoalDTO> searchExcs(String eName);
	int applyCheck(String sEmail, Long cNo);
	Boolean challengeCancel(Long cNo, String sEmail);
	int[] eNameSearch(String exercise);
	List<MyChallengeProceedDTO> proceedList(String sEmail);
	List<MyChallengeApplyDTO> applyList(String sEmail);
	List<MyChallengeEndDTO> endList(String sEmail);
	MyChallengeInfoDTO myChallengeInfo(Long cNo);
	List<MyChallengeSuccessCntMDTO> getMemSuccess(MyChallengeInfoDTO myChallengeInfoDTO);
	List<MyChallengeSuccessCntDDTO> getDaySuccess(MyChallengeInfoDTO myChallengeInfoDTO);
	int getTodaySuccess(MyChallengeInfoDTO myChallengeInfoDTO);
	void talkReg(MyChallengeTalkDTO myChallengeTalkDTO);
	List<MyChallengeGetTalkDTO> getTalk(Long cNo);
	List<MyChallengeGetTalkDTO> getTalkReply(Long reNo);
	void talkDel(int reNo, int checkTalk);
	void editTalk(int reNo, String reContent);
	List<MyChallengeGetMySuccessDayDTO> getMySuccessDay(MyChallengeInfoDTO myChallengeInfoDTO);
	int checkMem(Long cNo, String mEmail);
	List<ChallengeListDTO> loadMyList(ChallengeGetMyListDTO challengeGetListDTO);
	int getListSize(ChallengeGetListDTO challengeGetListDTO);
	int getMyListSize(ChallengeGetMyListDTO challengeGetListDTO);
	List<ChallengeReadGoalDTO> readSuccessGoal(Long cNo);

}
