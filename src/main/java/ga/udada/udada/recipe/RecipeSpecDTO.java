package ga.udada.udada.recipe;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class RecipeSpecDTO {

	private Long rNo;
	private String rTitle;
	private int sumKcal;
	private int sumProtein;
	private int sumFat;
	private int sumCarbo;
	
	
}
