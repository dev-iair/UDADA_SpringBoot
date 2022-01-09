package ga.udada.udada.challenge;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyChallengeGetTalkDTO {
	
	private Long reNo;
	private String mName;
	private String mEmail;
	private String reContent;
	private String reDate;
	private List<MyChallengeGetTalkDTO> talkReply;


}
