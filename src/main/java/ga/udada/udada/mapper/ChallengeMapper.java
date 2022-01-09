package ga.udada.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import ga.udada.udada.challenge.ChallengeDTO;
import ga.udada.udada.challenge.ChallengeGetListDTO;
import ga.udada.udada.challenge.ChallengeGetMyListDTO;
import ga.udada.udada.challenge.ChallengeGlistDTO;
import ga.udada.udada.challenge.ChallengeGoalDTO;
import ga.udada.udada.challenge.MyChallengeInfoDTO;
import ga.udada.udada.challenge.MyChallengeSuccessCntMDTO;
import ga.udada.udada.challenge.MyChallengeTalkDTO;
import ga.udada.udada.challenge.ChallengeListDTO;
import ga.udada.udada.challenge.ChallengeReadDTO;
import ga.udada.udada.challenge.ChallengeReadGoalDTO;
import ga.udada.udada.challenge.MyChallengeApplyDTO;
import ga.udada.udada.challenge.MyChallengeEndDTO;
import ga.udada.udada.challenge.MyChallengeGetMySuccessDayDTO;
import ga.udada.udada.challenge.MyChallengeGetTalkDTO;
import ga.udada.udada.challenge.MyChallengeProceedDTO;
import ga.udada.udada.challenge.MyChallengeSuccessCntDDTO;

public interface ChallengeMapper {

	List<ChallengeListDTO> loadList(ChallengeGetListDTO challengeGetListDTO);
	void register(ChallengeDTO challengeDTO);
	void registerGoal(ChallengeGoalDTO challengeDTO);
	void registerApply(ChallengeDTO challengeDTO);
	List<ChallengeGlistDTO> loadGlist(Long cNo);
	ChallengeReadDTO read(Long cNo);
	List<ChallengeReadGoalDTO> readGoal(Long cNo);
	Boolean challengeApply(@Param("cNo") Long cNo,@Param("sEmail") String sEmail);
	void modify(ChallengeDTO challengeDTO);
	void delGoal(ChallengeDTO challengeDTO);
	void modifyGoal(ChallengeGoalDTO challengeGoalDTO);
	void delete(Long cNo);
	List<ChallengeReadGoalDTO> searchExcs(String eName);
	int applyCheck(@Param("sEmail") String sEmail,@Param("cNo") Long cNo);
	Boolean challengeCancel(@Param("cNo") Long cNo,@Param("sEmail") String sEmail);
	int[] eNameSearch(String exercise);
	List<MyChallengeProceedDTO> proceedList(@Param("sEmail")String sEmail);
	List<MyChallengeApplyDTO> applyList(String sEmail);
	List<MyChallengeEndDTO> endList(String sEmail);
	MyChallengeInfoDTO myChallengeInfo(@Param("cNo")Long cNo);
	List<MyChallengeSuccessCntMDTO> getMemSuccess(MyChallengeInfoDTO myChallengeInfoDTO);
	List<MyChallengeSuccessCntDDTO> getDaySuccess(MyChallengeInfoDTO challengeInfoDTO);
	int getTodaySuccess(MyChallengeInfoDTO myChallengeInfoDTO);
	void talkReg(MyChallengeTalkDTO myChallengeTalkDTO);
	List<MyChallengeGetTalkDTO> getTalk(@Param("cNo")Long cNo);
	List<MyChallengeGetTalkDTO> getTalkReply(@Param("reNo")Long reNo);
	void talkDel(@Param("reNo")int reNo, @Param("checkTalk")int checkTalk);
	void editTalk(@Param("reNo")int reNo, @Param("reContent")String reContent);
	List<MyChallengeGetMySuccessDayDTO> getMySuccessDay(MyChallengeInfoDTO myChallengeInfoDTO);
	int checkMem(@Param("cNo")Long cNo, @Param("mEmail")String mEmail);
	List<ChallengeListDTO> loadMyList(ChallengeGetMyListDTO challengeGetListDTO);
	int getListSize(ChallengeGetListDTO challengeGetListDTO);
	int getMyListSize(ChallengeGetMyListDTO challengeGetListDTO);
	List<ChallengeReadGoalDTO> readSuccessGoal(@Param("cNo") Long cNo);
}
