# How to Provide Feedback

Thank you for taking the time to review the **Oncology Guideline and Coverage Authorization (OGCA)** Implementation Guide. Your input helps improve the quality, clarity, and accuracy of the specification.

All feedback is tracked as **GitHub Issues** in the [hl7-codex-ocpa repository](https://github.com/reason-healthcare/hl7-codex-ocpa/issues).

---

## What Kind of Feedback Are We Looking For?

There are two main areas where feedback is valuable:

| Area | What it covers | Examples |
|------|---------------|---------|
| **Narrative content** (`input/pagecontent/`) | Written explanations, use cases, background, diagrams, and guidance text that appears on the IG website | Unclear wording, missing context, factual errors, broken diagrams, suggested new pages |
| **Formal definitions** (`input/fsh/`) | FHIR profiles, extensions, value sets, code systems, and examples — the computable clinical definitions | Missing data elements, incorrect constraints, wrong terminology bindings, unclear profile intent |

Not sure which category your feedback falls into? That's fine — just describe what you observed and where. The team will sort it out.

---

## Option 1 — Open a GitHub Issue Directly (Recommended)

This is the most direct path and the most helpful format for the development team.

1. Go to the [Issues page](https://github.com/reason-healthcare/hl7-codex-ocpa/issues)
2. Click **New Issue**
3. Fill in the title and description using the guidelines below
4. Click **Submit new issue**

**For narrative / page content feedback**, include:
- The page name or URL (e.g., "Background page" or `https://reason-healthcare.github.io/hl7-codex-ocpa/background.html`)
- What you found unclear, incorrect, or missing
- Any suggested replacement text (optional but very helpful)

> **Example title:** `Background page: CMS-0062-P description needs clarification`
>
> **Example body:** _"The paragraph starting 'The regulatory pressure is now direct' implies only prescription drugs are covered. It would help to clarify which treatment categories are in scope."_

**For formal definition / FSH feedback**, include:
- The artifact name (e.g., profile name, value set name, or extension name)
- What you believe is incorrect or missing
- A reference to any relevant specification, guideline, or source

> **Example title:** `OGCARegimen profile: missing element for cycle duration`
>
> **Example body:** _"The regimen profile doesn't appear to capture the total number of cycles. NCCN guidelines for TCHP include a fixed number of cycles that should be expressible."_

---

## Option 2 — Edit the File Directly on GitHub (No Local Setup Required)

If you're comfortable with GitHub and want to suggest a text change to a narrative page, you can edit the file directly in the browser.

1. Navigate to the file in the repository:
   - Narrative pages live in [`input/pagecontent/`](https://github.com/reason-healthcare/hl7-codex-ocpa/tree/main/input/pagecontent)
   - FSH definitions live in [`input/fsh/`](https://github.com/reason-healthcare/hl7-codex-ocpa/tree/main/input/fsh)
2. Open the file you want to edit
3. Click the **pencil icon** (✏️ Edit this file) in the top-right corner
4. **GitHub will prompt you to fork the repository.** A fork is just your own personal copy of the project where you can make edits safely — it doesn't affect the original. Click **Fork this repository** to continue.
5. Make your changes in the editor
6. Scroll down to **Propose changes**
7. Enter a short description of what you changed and why
8. Click **Propose changes** — this creates a Pull Request for the team to review

This option works best for straightforward text corrections and small clarifications.

---

## Option 3 — Use Your AI Agent to File Feedback

If you use an AI coding agent (such as Claude, Cursor, GitHub Copilot, or a similar tool), you can describe your feedback in plain language and have the agent open a GitHub issue on your behalf.

**Example prompt to give your agent:**

> "I'm reviewing the OGCA FHIR Implementation Guide at https://github.com/reason-healthcare/hl7-codex-ocpa. On the Background page, the description of CMS-0062-P feels incomplete — it doesn't mention home infusion drugs. Please open a GitHub issue on that repository titled 'Background page: CMS-0062-P description missing home infusion drugs' and describe the gap."

Your agent will need:
- **Repository:** `reason-healthcare/hl7-codex-ocpa`
- **GitHub access** configured (a personal access token or logged-in `gh` CLI session)

The agent can also help you **draft** an issue if you're not sure how to phrase your feedback — just describe what confused or concerned you and let the agent write the structured issue.

---

## Option 4 — Send Feedback by Email

If none of the above options work for you, you can send feedback by email to the project team. The team will transcribe your comments into GitHub issues so they are tracked alongside all other feedback.

> **Note:** Please describe the page or artifact you are commenting on and be as specific as possible so your feedback can be accurately captured.

---

## Tips for Effective Feedback

- **Be specific about location.** "Page X, paragraph 3" is easier to act on than "somewhere in the document."
- **Separate concerns.** If you have feedback on three different pages, open three separate issues — it's easier to track and close them independently.
- **Suggest a fix if you can.** Even a rough alternative phrasing speeds up resolution significantly.
- **Reference your source.** If you're pointing out a clinical or regulatory inaccuracy, link or cite the authoritative source.
- **Questions are welcome.** If something is unclear and you're not sure if it's a bug, open an issue anyway — a question that reveals an unclear section is just as valuable as a correction.

---

## Quick Reference

| Goal | Best option |
|------|------------|
| Report a problem or ask a question | [Open a GitHub Issue](https://github.com/reason-healthcare/hl7-codex-ocpa/issues/new) |
| Fix a typo or small text error yourself | Edit on GitHub (pencil icon) |
| Suggest a change with AI assistance | Option 3 (agent prompt) |
| Not comfortable with GitHub | Option 4 (email) |

---

*For questions about the feedback process itself, open an issue with the label `meta` or reach out to the project team directly.*
