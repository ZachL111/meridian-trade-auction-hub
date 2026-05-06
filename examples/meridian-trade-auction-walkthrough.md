# Meridian Trade Auction Hub Walkthrough

The fixture is intentionally compact, so the review starts with the cases that pull farthest apart.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | spread pressure | 231 | ship |
| stress | fill risk | 184 | ship |
| edge | portfolio drift | 175 | ship |
| recovery | quote width | 152 | ship |
| stale | spread pressure | 184 | ship |

Start with `baseline` and `recovery`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`baseline` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
