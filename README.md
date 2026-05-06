# meridian-trade-auction-hub

`meridian-trade-auction-hub` explores trading systems with a small Zig codebase and local fixtures. The technical goal is to design a Zig verification harness for auction systems, covering visual model generation, layout fixtures, and failure-oriented tests.

## Project Rationale

The point is to make a small domain rule concrete enough that a reader can change it and immediately see what broke.

## Meridian Trade Auction Hub Review Notes

Start with `spread pressure` and `quote width`. Those cases create the widest score spread in this repo, so they are the best quick check when the model changes.

## Feature Set

- `fixtures/domain_review.csv` adds cases for spread pressure and fill risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/meridian-trade-auction-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `spread pressure` and `quote width`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Architecture

The repository has two validation layers: the original compact policy fixture and the domain review fixture. They are separate so one can change without hiding failures in the other.

The added Zig path is deliberately direct, with fixtures doing most of the explaining.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Test Command

The check exercises the source code and the review fixture. `baseline` is the high score at 231; `recovery` is the low score at 152.

## Next Improvements

The repository is intentionally scoped to local checks. I would expand it by adding adversarial fixtures before adding features.
