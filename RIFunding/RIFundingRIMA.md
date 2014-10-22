RI Funding Formula
========================================================
author: Jason Becker
date: 2014-10-15
transition: rotate
font-import: http://fonts.googleapis.com/css?family=Open+Sans
font-family: 'Open Sans'

Big Picture
========================================================
incremental: true

- The state provides about $800M of about $2.1B total.
- There are three sources of funding-- state, municipal, and federal. We'll only talk the first two.
- Funding is primarily driven by property taxes and property values.
- In the end, the same students would result in the same funding wherever they are.

State Funding
=======================================================
incremental: true

### What Goes In
- How many students?
- How many are free or reduced price lunch eligible?
- How many students in PK-6 are free or reduced price lunch eligible?
- What is the median income of a community?
- What is the total taxable property value in a community?


State Funding
==============================================================

Two constants:

- Core Instruction Amount
  - The average spending of several New England states, inflated to the current year.
  
- FRPL Weight
  - 40%
  
$$
Core = N_{tot}C + 0.4N_{frpl}C
$$

State Funding
========================================================

## What is the core?

> Includes *marginal* spending required for the BEP. It excludes some elements that are state supported off-formula (capital improvement, pension contributions) as well as some other fixed costs associated with building maintenance, etc.

## UCOA to recreate the core
**Remove**<br>
*Functions*: $311, 312, 313, 321, 411, 432, 433, 441$<br>
*Objects*: $52203, 52205, 52207$ <br>
*Function x Object*: $431 \cap 55111, 431 \cap 56406$<br>
*Funds*: $21, 22, 30, 31, 32$

State Share Ratio
===========================================================

**State share ratio:** the proportion of the core instruction amount that is provided to each district. This is meant to take into account ability of districts to raise adequate funds locally and drive more dollars where students who are poor attend schools.

### Before
$$Core=N_{tot}C+0.4N_{frpl}C$$

### Actual
$$StateFunds = SSR(N_{tot}C+0.4N_{frpl}C)$$

State Share Ratio
===========================================================

## What Goes In
**Equalized Weighted Assessment Value**<br>
Fancy way of saying property values multiplied by median family income.
- Details are a lot of what is unfair is likely in this value, although it pre-dated the formula.

**PreK - 6 FRPL**<br>
Better measure of community poverty level, since students underenroll as they get older.

**RADM**<br>
Resident average daily membership -- how many students live in a district who attend a public school.

State Share Ratio
===========================================================
## Step 1
$$
SSRC = 1 - 0.475 [\frac{\frac{DistrictEWAV}{DistrictRADM}}{\frac{StateEWAV}{StateRADM}}]
$$
> A district with the average property values per student and average median income would have an SSRC of 0.525.

## Step 2

$$ State Share Ratio = \sqrt\frac{SSRC^{2} + PK6FRPL^{2}}{2} $$

Example District
===========================================================


$$ Core Instruction = \$9,000$$


| LEA | ADM | FRPL | Core | EWAV | PK6FRPL | SSR | Aid |
| :--- | --: |--:| --:| --:| --:| --:| --:|
| Washington | 1000 | 650 | $11,340,000 | 0.45 | 0.5 | .476 | $5,397,840 |
| Adams Charter | 200 | 180 | $2,448,000 | 0.45 | 0.5 | .476 | $1,165,248 |

Local Funding
===========================================================
incremental: true

- Completely different concept
- Not about supporting specific level or activities
- Community support through taxes should be equal for all students who live in that community regardless of what public school they attend.

Local Funding
===========================================================

$$ \text{Local Support} = \text{Property Value} * \text{School Tax Rate}$$

$$
\text{Charter Tuition} = \frac{\text{Local Support}}{\text{District RADM}}$$

> Effect is that students receive the same per pupil support in district and at charter schools. This mirrors the equal support from state aid.

*Capital expenditures are excluded from the Local Support value before calculating tuitions.*
