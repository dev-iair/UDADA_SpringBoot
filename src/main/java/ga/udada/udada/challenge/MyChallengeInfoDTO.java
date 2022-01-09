package ga.udada.udada.challenge;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyChallengeInfoDTO {
	
	private Long cNo;
	private String cTitle;
	private Date cStart;
	private Date cFinish;	
	private int procDate;
	private int totalDate;
	private int progress;
	private int goalCnt;
	private int memCnt;
	private int totalScs;
	private int mySuccess;
	private String mEmail;
	private String charStart;
	private String charFinish;
	List<ChallengeReadGoalDTO> goalList;
	
	
}
