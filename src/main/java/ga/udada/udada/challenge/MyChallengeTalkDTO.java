package ga.udada.udada.challenge;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyChallengeTalkDTO {
	
	private Long oriNo;
	private String mEmail;
	private String reContent;
	private int groupNo;
	private int reIndent;
	
}
