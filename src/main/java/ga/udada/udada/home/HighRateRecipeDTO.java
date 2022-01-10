package ga.udada.udada.home;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HighRateRecipeDTO {
	
	private Long rNo;
	private String rTitle;
	private String rgAvg;

}