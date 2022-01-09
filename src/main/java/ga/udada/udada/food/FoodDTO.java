package ga.udada.udada.food;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodDTO {

	private String fNo;
	private String fName;
	private String fMjclass;
	private String fMinclass;
	private int fOnceoffer;
	private int fKcal;
	private int fProtein;
	private int fFat;
	private int fCarbo;
	
}
