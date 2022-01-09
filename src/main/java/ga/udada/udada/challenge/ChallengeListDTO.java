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
public class ChallengeListDTO {
	
	private Long cNo;
	private String cTitle;
	private Date cStart;
	private Date cFinish;
	private Long cTotal;
	private Date cDate;
	private Long caCnt;
	private List<ChallengeGlistDTO> gList;
	private String cIng;



}
