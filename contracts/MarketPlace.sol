// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/** 
* @title MarketPlace
* @dev Follow the shipment of an item
*/
contract MarketPlace {
    enum ShippingStatus{ PENDING, DELIVERED, SHIPPED }

    ShippingStatus status;
    address owner;
    address customer;

    event MissionStart(address customer);
    event MissionComplete(address customer);

    /**
    * @dev Constructor that initialize owner and status
    */
    constructor() {
        owner = msg.sender;
        status = ShippingStatus.PENDING;
    }

    /**
    * @dev Change the status of the shipment to shipped
    * @param _customer the address of the customer
    */
    function shipped(address _customer) public _ownerOnly {
        status = ShippingStatus.SHIPPED;
        customer = _customer;
        emit MissionStart(_customer);
    }

    /**
    * @dev Change the status of the shipment to delivered
    * @param _customer the address of the customer
    */
    function delivered(address _customer) public _ownerOnly {
        status = ShippingStatus.DELIVERED;
        customer = _customer;
        emit MissionStart(_customer);
    }

    /**
    * @dev Get the status for the owner
    * @return A string representation of the status
    */
    function getStatus() public view _ownerOnly returns (string memory) {
        return getLabelFromEnum(status);
    }

    /**
    * @dev Get the status for the customer
    * @return A string representation of the status
    */
    function Status() public payable _customerOnly returns (string memory) {
        return getLabelFromEnum(status);
    }

    /**
    * @dev Get the string representation of the given status 
    * @return A string representation of the status
    */
    function getLabelFromEnum(ShippingStatus _status) private pure returns (string memory) {
        if (_status == ShippingStatus.PENDING) {
            return "PENDING";
        }
        else if (_status == ShippingStatus.SHIPPED) {
            return "SHIPPED";
        }
        else if (_status == ShippingStatus.DELIVERED) {
            return "DELIVERED";
        } else {
            return "UNKNOWN Status"; // Note : this case is supposed to never happen in any execution path
        }
    }

    /**
    * @dev Modifier to restrain function usage to the contract owner only
    */
    modifier _ownerOnly(){
      require(msg.sender == owner);
      _;
    }

    /**
    * @dev Modifier to restrain function usage to the customer only
    */
    modifier _customerOnly(){
      require(msg.sender == customer);
      _;
    }
}