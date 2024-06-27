require(): Used to validate input and make sure all prerequisites are satisfied before running the code.
As an illustration, make sure the caller is the owner, confirm the amount given is accurate, and make sure there is enough money to make a withdrawal.
assert(): This function verifies internal criteria that ought to always be met. if the condition fails, uses up all of the gas.
Example: Verifying the contract balance before to making a last-minute withdrawal.
revert(): Provides an error message and explicitly reverses the transaction.
Managing unforeseen circumstances with the emergency withdrawal feature is shown in the code.
We have created 3 functions:-
i)deposit :- which will deposit the ether
ii) withdraw :- which will withdraw the amount
iii)emergencyWithdraw :- which will withdraw the amount in emergency.
