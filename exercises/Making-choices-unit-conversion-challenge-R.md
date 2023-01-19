---
layout: exercise
topic: Making Choices
title: Energy Conversion Challenge
language: R
---
<style type="text/css">
    ul { list-style-type: none; }
</style>

Measures of the amount of energy used by biological processes are critical to
understanding many aspects of biology from cellular physiology to ecosystem
ecology.

There are many different units for energy and their utilization varies across methods, research areas, and lab groups.

1\. Write a function with the form `convert_energy_units(energy_value, input_unit, output_unit)` to convert units between the following energy values:
  - Joules(J),
  - Kilojoules(KJ),
  - Calories(CAL),
  - and Kilocalories (KCAL; *this unit is used for labeling the amount of energy contained in food*).

  To write the equations to convert between units, consider the following:
  - A Kilojoule is 1000 Joules,
  - a Calorie is 4.1868 Joules,
  - a Kilocalorie is 4186.8 Joules.

  An example of a call to this function would look like:

  ```
  energy_in_cal <- 200
  energy_in_j <- convert_energy_units(energy_in_cal, "CAL", "J")
  ```

2\. Test your function by running the example call above.

3\. Modify the function so that if either the input unit or the output unit do not match any of the four unit types given above, have the
function print - "Sorry, I don't know how to convert + name of the unit provided".

4\. Use your function to answer the following questions:

  - a) What is the daily metabolic energy used by a human (~2500 KCALs) in Joules.

  - b) How many times more energy does a common seal use than a human? The common  seal uses ~52,500 KJ/day ([Nagy et al. 1999](http://www.annualreviews.org/doi/abs/10.1146/annurev.nutr.19.1.247)). Use the daily human metabolic cost calculated in (4a).

  - c) How many ergs (ERG) are there in one kilocalorie. *Since we didn't include the erg conversion this should trigger our 'don't know how to convert' message*.

5\. Make the function more efficient, and instead of writing an individual conversion between each of the different units (which requires 12 if statements) you could choose to convert all of the input units to a common scale and then convert from that common scale to the output units. This approach is especially useful if you need to add new units later.
