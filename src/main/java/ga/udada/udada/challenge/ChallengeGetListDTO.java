package ga.udada.udada.challenge;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChallengeGetListDTO {
	
	private String period;
	private String keyword;
	private String exercise;
	private Boolean ing;
	private Double pageNo;
	private Double nowPage;
	private Double startPage;
	private Double endPage;
	private Long startNo;
	private Long endNo;
	private Date start;
	private Date finish;
	private int[] excsResult;

	
}
