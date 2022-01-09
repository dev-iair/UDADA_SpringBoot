package ga.udada.udada.foodmy;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodMyRecommendDTO {

	private int recommendKcal;
	private String message;
	private String img;
}
