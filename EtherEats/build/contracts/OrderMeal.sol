pragma solidity ^0.5.0;

contract EtherEats {
    struct mealOrder {
        address customerAccount;
        address shopAccount;
        string[] food;
        uint[] price;
    }
    
    // Helper functions
     function remove(uint index) private { /* Borrowed from Ethereum stack exchange */
        if (index >= array.length) return;

        for (uint i = index; i<array.length-1; i++){
            array[i] = array[i+1];
        }
        delete array[array.length-1];
        array.length--;
    }
    function findElement(mealOrder[] memory orders, mealOrder memory order) view private returns (int) {
        for (uint i=0; i < orders.length; i++) {
            if (orders[i] == order) { return i; }
        }
        return -1;
    }

    // Meal events
    //event mealOrdered(mealOrder memory meal, uint16[3] timeOrdered);
    //event mealProcessed(mealOrder memory meal, uint16[3] timeProcessed);

    mealOrder[] public pendingOrders;
    mealOrder[] public processedOrders;

    function payForMeal(mealOrder memory meal) view public {
        /* send eth to company from user account */
    }

    function _moveProcessedMeal(mealOrder memory meal) private {
        uint idinSlice = findElement(pendingOrders, meal);
        processedOrders.push(pendingOrders[idinSlice]);
        remove(pendingOrders, idinSlice);
    }
}