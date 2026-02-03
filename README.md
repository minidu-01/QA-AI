# SEER QA – AI-Driven Full QA Flow

## Overview

This repository contains an **AI-assisted QA workflow** designed for the SEER project.  
The goal is to help QA engineers:

- Understand code changes clearly
- Validate alignment with requirements or bug fixes
- Identify system and QA impact
- Generate or update test cases
- Optimize regression testing
- Maintain strong traceability and auditability

The workflow is driven by a **single master agent**:
agents/full_flow_agent.md


This agent behaves like a **senior QA lead**, guiding and executing the entire QA decision flow.

---

## High-Level Flow

1. Pull latest DEV changes into QA workspace
2. Snapshot previous vs current code
3. Select QA scenario:
   - Requirement Change
   - Bug Fix
4. Run the Full Flow Agent in Cursor
5. Review generated QA artifacts
6. Execute testing based on outputs

---

## Repository Structure (Key Folders)

seer-qa/
├── agents/
│   ├── full_flow_agent.md        # Master orchestrator (main entry point)
│   ├── code_diff_agent.md        # Code change extraction
│   ├── requirement_agent.md      # Requirement / expectation delta
│   ├── alignment_agent.md        # Requirement–code alignment
│   ├── impact_agent.md           # System + QA impact analysis
│   ├── testcase_agent.md         # Test case generation / update
│   └── regression_agent.md       # Regression optimization
│
├── scripts/
│   ├── sync_codebase.sh          # Sync dev repo → QA repo
│   └── generate_diff.sh          # Prepare changed files
│
├── codebase/
│   ├── previous/                 # Last QA-verified snapshot
│   └── current/                  # Latest dev snapshot
│
├── requirements/
│   ├── old/                      # Previously approved requirements
│   └── new/                      # Updated requirements
│
├── Bugs/
│   ├── BUG-YYYYMMDD-001.md       # Example bug file
│   └── BUG-YYYYMMDD-002.md
│
├── inputs/
│   ├── code-diff/                # Changed files only
│   ├── testcases/                # Existing test cases (CSV / XLS / MD)
│   └── context.md                # Optional domain / project context
│
└── outputs/
    ├── change-analysis/          # Code & requirement changes
    ├── alignment-analysis/       # Alignment reports
    ├── impact-analysis/          # Impact analysis
    ├── generated-tests/          # New / updated test cases
    └── regression-scope/         # Optimized regression list




---

## Prerequisites

Before running the QA flow, ensure:

- Git is installed
- Cursor IDE is installed
- You have access to:
  - `seer-dev` repository
  - `seer-qa` repository
- Required folders exist (as per structure above)

---

## Step 1 – Sync Codebase

From inside the `seer-qa` folder:

```bash
chmod +x scripts/sync_codebase.sh
./scripts/sync_codebase.sh
This will:

Move the previous QA-verified code into codebase/previous

Pull the latest DEV code

Update codebase/current

(Optional but recommended)

./scripts/generate_diff.sh
This prepares a focused list of changed files for AI analysis.

Step 2 – Prepare Inputs
For Requirement Change Flow
Place previous requirements in:

requirements/old/
Place new or updated requirements in:

requirements/new/
For Bug Fix Flow
You have two options:

Option A (Recommended)
Create a bug file inside:

Bugs/
Example file structure:

Bug Title:
Related Area / Module:
Steps to Reproduce:
Actual Result:
Expected Result:
Notes:
Option B
If no bug file exists, you will paste the bug details directly when prompted by the agent.

Step 3 – Run the Full Flow Agent in Cursor
Open Cursor

Open the seer-qa folder

Open:

agents/full_flow_agent.md
Select relevant folders/files in the file explorer:

codebase/previous

codebase/current

requirements/old and requirements/new (if requirement change)

Bugs/ (if bug fix)

inputs/testcases

Press Ctrl + L (or Cmd + L on macOS)

Step 4 – Scenario Selection (Interactive)
The agent will first ask:

Which QA scenario is this?

REQUIREMENT_CHANGE

BUG_FIX

Short description of the change or bug

Known impacted areas (optional)

If BUG_FIX is selected:

The agent will check the Bugs/ folder

If no bug file is found, it will ask you to paste the bug details

The flow will not proceed until required information is provided.

Step 5 – Automated QA Flow Execution
Once inputs are confirmed, the agent will execute six sections in order:

Code Change Extraction

Requirement / Bug Expectation Delta

Requirement–Code Alignment

System & QA Impact Analysis

Test Case Generation / Update

Regression Optimization

You do not need to manually trigger individual agents.

Step 6 – Review Outputs
All outputs are saved with scenario + timestamp for traceability.

Example output files:
REQUIREMENT_CHANGE_2026-02-03_14-25_code_changes.md
BUG_FIX_2026-02-03_15-10_alignment_report.md
BUG_FIX_2026-02-03_15-10_impact_report.md
BUG_FIX_2026-02-03_15-10_new_testcases.csv
BUG_FIX_2026-02-03_15-10_regression_list.md
Key files to review first:
*_alignment_report.md → Quality gate

*_impact_report.md → Risk & scope

*_generated-tests.csv → What to test

*_regression_list.md → Regression plan

How QA Should Use the Outputs
Alignment Report
Decide if the change is acceptable or should be blocked.

Impact Report
Understand which modules and tests are at risk.

Generated Test Cases
Add to test management tools or execute manually/automated.

Regression Scope
Run only what is necessary, based on risk.

Best Practices
Always run sync_codebase.sh before analysis

Keep requirements/old and requirements/new clean and up to date

Prefer bug files in Bugs/ for traceability

Treat NOT_ALIGNED and NEEDS_CLARIFICATION as blockers

Archive outputs per sprint or release for audits

What This Flow Is (and Is Not)
This IS:
AI-assisted QA decision support

A structured, repeatable QA process

Suitable for feature changes and bug fixes

Designed for real-world QA teams

This is NOT:
A replacement for human QA judgment

A test execution tool

A CI/CD automation pipeline (yet)

Final Note
This flow is intentionally designed to:

Mirror how senior QA engineers think

Reduce rework and missed coverage

Improve confidence in releases

Use it as a QA intelligence layer, not a black box.

Questions / Improvements
If something is unclear or can be improved:

Adjust the agent prompt

Add more context files

Extend the workflow carefully

Quality improves through iteration.