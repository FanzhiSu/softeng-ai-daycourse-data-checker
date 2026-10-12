# Course practical design

The practicals are designed around one repository and one Codespace for the day.

## 1. Software design

Starting brief: build a tool that checks research data for potential problems before analysis.

Participants choose a research context, first form their own view, then use a chat assistant to challenge assumptions and develop requirements/use cases. They produce a lightweight design. A prototype is optional, not required.

Instructor checkpoints can show one worked context and one possible decomposition. Participants then converge on the prepared repository for the rest of the day.

## 2. Dependency management

Starter repository has an intentionally loose NumPy dependency. The code uses `np.float_` in a separate legacy-style helper so a current NumPy 2.x environment exposes a compatibility problem. Participants create/activate a virtual environment, run the software, diagnose the failure, install NumPy 1.26.4, and record the working requirement.

Checkpoint: compare the failure in a newer environment with the successful run in the pinned environment. Optional AI extension: ask the assistant to explain the error without modifying the repository.

## 3. Testing

Participants add tests to the existing code. They write one expectation themselves, observe a failure by deliberately breaking the implementation, repair it, then expand the suite with boundary and edge cases. After the core testing mechanics are established, AI is used to suggest additional tests.

The repository includes `find_duplicates()` with deliberately simplistic behaviour. Participants use AI to characterise its current behaviour. This test is retained for the later reveal that repeated sample IDs can be legitimate across timepoints.

## 4. Version control

Participants learn the local Git model by inspecting status/history, making a small manual change, inspecting the diff, staging and committing, branching, making an unwanted change, and recovering. Only after that do they give a coding agent a bounded implementation task with no commit/push authority.

## 5. Collaborative development

Participants use the same repository on GitHub. A prepared issue asks for a small feature. Participants create a branch, implement the change, run tests, commit, push, open a pull request, inspect CI, and make a follow-up change. The engineering point is that the remote repository is the agreed source of truth and that changes enter it through a visible gate.

For the agent portion, the agent is explicitly prohibited from committing, pushing, creating issues/PRs or merging. Participants inspect its working-tree changes and then decide what happens next.

## Final reveal

Run the longitudinal example and investigate why valid repeated sample IDs are rejected. Trace the failure back to the characterisation test. Discuss what the tests, Git history, review and CI did establish, and what they could not establish without domain knowledge.
