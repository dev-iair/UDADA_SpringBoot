package ga.udada.udada.challenge;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChallengeReadGoalDTO {

	private Long cNo;
	private Long eNo;
	private String eName;
	private Long cgTime;
	private Long eKcal;


	
	
}
