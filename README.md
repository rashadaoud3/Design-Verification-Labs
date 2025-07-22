# 🧪 Design Verification Labs (SystemVerilog & UVM)

This repository contains a collection of training labs and exercises completed during my internship at **Orion VLSI Technologies** in the field of **Design Verification Engineering**.

The labs focus on learning and practicing functional verification using **SystemVerilog**, simulation tools like **Cadence Xcelium**, and later on, the **Universal Verification Methodology (UVM)**.

---

## 📁 Repository Structure

Each folder in this repository represents a specific lab or topic covered during the training.  
Folders are organized by lab number and content, following the structure used throughout the internship.

> The structure is designed to keep labs modular, organized, and easy to navigate.

---

## ▶️ How to Run Simulations

Most labs are simulated using **Cadence Xcelium (xrun)**. Below are the standard commands:

### 🔹 Run simulation (terminal only):

`xrun -sv <design_file>.sv <testbench_file>.sv`


### 🔹 Run simulation with GUI waveform viewer (SimVision):

`xrun -sv -access +rwc -gui <design_file>.sv <testbench_file>.sv`

Replace <design_file> and <testbench_file> with actual filenames inside each lab folder.

---

## 🧰 Tools Used
#### 🔹SystemVerilog for RTL and testbenches

#### 🔹Cadence Xcelium (xrun) for compilation and simulation

#### 🔹SimVision (Verisium) for GUI-based waveform debugging

#### 🔹Linux terminal & shell scripting for automation


## 👩‍💻 Author
**Rasha Daoud**

Intern Design Verification Engineer at Orion VLSI Technologies 
