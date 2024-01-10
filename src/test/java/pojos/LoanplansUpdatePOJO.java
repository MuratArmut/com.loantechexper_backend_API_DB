package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoanplansUpdatePOJO {

    /*
    {
        "category_id": 11,
        "name": "Personal Finance Loan ",
        "title": "Personal Finance Loan"
    }
     */

    private int category_id;
    private String name;
    private String title;

}


