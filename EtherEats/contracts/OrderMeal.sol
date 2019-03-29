pragma solidity ^0.4.25;

contract EtherEats {
     function remove(uint index) private { /* Borrowed from Ethereum stack exchange */
        if (index >= array.length) return;

        for (uint i = index; i<array.length-1; i++){
            array[i] = array[i+1];
        }
        delete array[array.length-1];
        array.length--;
    }

    function findElement(mealOrder[] orders, mealOrder order) view private returns (int) {
        for (uint i=0; i < orders.length; i++) {
            if (orders[i] == order) { return i; }
        }
        return -1;
    }

    event mealOrdered(mealOrder meal, timeOrdered);
    event mealProcessed(mealOrder meal, timeProcessed);

    struct mealOrder {
        address customerAccount;
        address shopAccount;
        string[] food;
        uint[] price;
    }

    mealOrder[] public _pendingOrders;
    mealOrder[] public _processedOrders;

    function payForMeal(mealOrder meal) view public {
        /* send eth to company from user account */
    }

    function _moveProcessedMeal(mealOrder meal) private {
        uint idinSlice = findElement(_pendingOrders, meal);
       _processedOrders.push(_pendingOrders[idinSlice]);
       remove(_pendingOrders, idinSlice);
    }
}