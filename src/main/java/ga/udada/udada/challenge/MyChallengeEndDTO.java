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
public class MyChallengeEndDTO {
	
	private Long cNo;
	private String cTitle;
	private String mEmail; 
	private Date cStart;
	private Date cFinish;
	private List<ChallengeGlistDTO> gList;

	
}
