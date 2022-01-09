package ga.udada.udada.challenge;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyChallengeSuccessCntMDTO {
	
	private String mEmail;
	private int success;	
	private String mName;
	

}
