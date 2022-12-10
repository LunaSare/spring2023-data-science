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

There are many different units for energy and their utilization varies across methods, research areas, and lab groups:
- Joules(J),
- Kilojoules(KJ),
- Calories(CAL),
- and Kilocalories (KCAL; *this unit is used for labeling the amount of energy contained in food*).

To write the equations to convert between units, consider the following:
- A Kilojoule is 1000 Joules,
- a Calorie is 4.1868 Joules,
- a Kilocalorie is 4186.8 Joules.


1\. Write a function with the form `convert_to_joules(energy_value, input_unit)` to convert units to joules:

  An example of a call to this function would look like:

  ```
  energy_in_cal <- 200
  energy_in_j <- convert_to_joules(energy_in_cal, "CAL")
  ```

2\. Test your function by running the example call above.

3\. Modify the function so that if the input unit do not match any of the four unit types given above, have the
function print - "Sorry, I don't know how to convert " + the name of the input unit.

4\. Use your function to answer the following questions:

  - a) What is the daily metabolic energy used by a human (~2500 KCALs) in Joules.

  - b) How many times more energy does a common seal use than a human? The common  seal uses ~52,500 KJ/day ([Nagy et al. 1999](http://www.annualreviews.org/doi/abs/10.1146/annurev.nutr.19.1.247)). Use the daily human metabolic cost calculated in (4a).

  - c) How many ergs (ERG) are there in one kilocalorie. *Since we didn't include the erg conversion this should trigger our 'don't know how to convert' message*.

5\. Write a function with the form `convert_energy_units(energy_value, input_unit, output_unit)` that converts between all the energy units above.
Instead of writing an individual conversion between each of the different units (which requires 12 if statements), make the function efficient, and convert all of the input units to a common scale and then convert from that common scale to the output units. This will make it easier if you need to add new units later.
