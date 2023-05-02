---
layout: page
element: lecture
title: 'Getting phylogenetic trees 2'
language: R
---

## Homework Review

1. Extract the OTT id of a biological group using the function `tnrs_match_names()`.
2. Get a subtree from the group using its OTT id.
3. If you get an error, try with a different group until you get a subtree from Open Tree
4. Plot your subtree

## Working with non-monophyletic taxa

- Example: a subtree of the genus _Canis_
- Finding "broken" and "invalid" taxa with `is_in_tree()`
- Getting the MRCA of a taxon with `tol_node_info()`
- Getting a subtree using a node id instead of the taxon OTT id with `tol_subtree(node_id = MY NODE ID)`

## Getting an induced tree from Open Tree of Life

- Get an induced subtree for a set of taxa and plot it with `tol_induced_subtree()`
- Example: Get an induced tree for the 3 orders of amphibians
- For families:
  ```
  amphibia_families <- datelife::get_ott_children(ott_ids = resolved_names["Amphibia",]$ott_id, ott_rank = "family")
  ```
