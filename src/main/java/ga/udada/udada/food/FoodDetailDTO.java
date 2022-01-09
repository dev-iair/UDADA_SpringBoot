package ga.udada.udada.food;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodDetailDTO {
	
	private String fNo;
	private String fName;
	private String fMinclass;

}
