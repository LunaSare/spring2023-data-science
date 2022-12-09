---
layout: exercise
topic: Making Choices
title: DNA or RNA Iteration
language: R
---

<!-- This is a follow-up to [DNA or RNA]({{ site.baseurl }}/exercises/Making-choices-dna-or-rna-R). -->

1. Write a function with the form `dna_or_rna(sequence)`, that determines if a sequence
of base pairs is DNA, RNA, or if it is not possible to tell given the
sequence provided. Since all the function will know about the material is the
sequence as character vector, the only way to tell the difference between DNA and RNA is that
RNA has the base Uracil (`"u"`) instead of the base Thymine (`"t"`). Have the
function return one of three outputs: `"DNA"`, `"RNA"`, or `"UNKNOWN"`.


2. Create the following vector of sequences; use the function you created in (1) and a `for` loop to print the type of each element in the vector `sequences`:

```
sequences = c("ttgaatgccttacaactgatcattacacaggcggcatgaagcaaaaatatactgtgaaccaatgcaggcg", "gauuauuccccacaaagggagugggauuaggagcugcaucauuuacaagagcagaauguuucaaaugcau", "gaaagcaagaaaaggcaggcgaggaagggaagaagggggggaaacc", "guuuccuacaguauuugaugagaaugagaguuuacuccuggaagauaauauuagaauguuuacaacugcaccugaucagguggauaaggaagaugaagacu", "gauaaggaagaugaagacuuucaggaaucuaauaaaaugcacuccaugaauggauucauguaugggaaucagccggguc")
```

3. Use the function you created in (1) and `sapply()` to print the type of the sequences in the vector `sequences` that you created in (2).

4. Explain what is the main difference between a `for` loop and an `sapply` function; elaborate.

5. *Optional*: For a little extra challenge make your function work with both upper
and lower case letters, or even strings with mixed capitalization.
