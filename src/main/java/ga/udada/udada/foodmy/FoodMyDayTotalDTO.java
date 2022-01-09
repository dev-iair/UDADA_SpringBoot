package ga.udada.udada.foodmy;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodMyDayTotalDTO {

	private int dayTotalKcal;
	private int dayTotalCarbo;
	private int dayTotalProtein;
	private int dayTotalFat;

}
