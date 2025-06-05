// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 7561
// Hash 1545
// Hash 3927
// Hash 7588
// Hash 7231
// Hash 8677
// Hash 9327
// Hash 3714
// Hash 9409
// Hash 3676
// Hash 8751
// Hash 6141
// Hash 4280
// Hash 8576
// Hash 6500
// Hash 2513
// Hash 4011
// Hash 2488
// Hash 3389
// Hash 3819
// Hash 8372
// Hash 8389
// Hash 6233
// Hash 6806
// Hash 8805
// Hash 4775
// Hash 7902
// Hash 5268
// Hash 8326
// Hash 9770
// Hash 2949
// Hash 8600
// Hash 7822
// Hash 7779
// Hash 6133
// Hash 6601
// Hash 9804
// Hash 3380
// Hash 1591
// Hash 2032
// Hash 1470
// Hash 4734
// Hash 8344
// Hash 9895
// Hash 1050
// Hash 6540
// Hash 1803
// Hash 6174
// Hash 2697
// Hash 5863
// Hash 8517
// Hash 1846
// Hash 4811
// Hash 4455
// Hash 3160
// Hash 5179
// Hash 1155
// Hash 7457
// Hash 8589
// Hash 2508
// Hash 9981
// Hash 2867
// Hash 2198
// Hash 7673
// Hash 6843
// Hash 8355
// Hash 7979
// Hash 5998
// Hash 8578
// Hash 8185
// Hash 6910
// Hash 1743
// Hash 4793
// Hash 5462
// Hash 1973
// Hash 8779
// Hash 9414
// Hash 1382
// Hash 3269
// Hash 7290
// Hash 1055
// Hash 7374
// Hash 5269
// Hash 3949
// Hash 4512
// Hash 2632
// Hash 1780
// Hash 2166
// Hash 6729
// Hash 8271
// Hash 6891
// Hash 7112
// Hash 3878
// Hash 2690
// Hash 1401
// Hash 2053
// Hash 5255
// Hash 2003
// Hash 1844
// Hash 4764
// Hash 1668
// Hash 4512
// Hash 7677
// Hash 8151
// Hash 1249
// Hash 6416
// Hash 4313
// Hash 7587
// Hash 6049
// Hash 1957
// Hash 2142
// Hash 7451
// Hash 6942
// Hash 6180
// Hash 6309
// Hash 4123
// Hash 8267
// Hash 4572
// Hash 9240
// Hash 8278
// Hash 1697
// Hash 4275
// Hash 8792
// Hash 2856
// Hash 1385
// Hash 1800
// Hash 8684
// Hash 3023
// Hash 5801
// Hash 4909
// Hash 9900
// Hash 4544
// Hash 1152
// Hash 2414
// Hash 9999
// Hash 3910
// Hash 4349
// Hash 3188
// Hash 2674
// Hash 1169
// Hash 7284
// Hash 4674
// Hash 7278
// Hash 9695
// Hash 7993
// Hash 4786
// Hash 7701
// Hash 9179
// Hash 7558
// Hash 5639
// Hash 7853