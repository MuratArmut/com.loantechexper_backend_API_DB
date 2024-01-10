package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WithdrawalRejectPOJO {

    /*
    {
    "details":"Something went wrong."
    }
     */

    private String details;
}
