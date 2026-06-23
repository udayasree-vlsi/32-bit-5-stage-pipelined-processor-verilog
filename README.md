# 32-Bit 5-Stage Pipelined Processor Using Verilog HDL

## Overview

This project presents the design, implementation, and verification of a **32-Bit 5-Stage Pipelined Processor** developed using **Verilog HDL**. The processor improves instruction throughput by overlapping instruction execution across multiple stages, enabling higher performance compared to a traditional single-cycle architecture.

The design incorporates essential pipelining techniques including **pipeline registers**, **data forwarding**, **hazard detection**, and **branch handling**, ensuring correct execution while minimizing performance penalties caused by data and control hazards.

The processor was designed, simulated, and verified using **Xilinx Vivado Design Suite**.

---

## Key Features

* 32-Bit Processor Architecture
* 5-Stage Instruction Pipeline
* Modular Verilog HDL Design
* Pipeline Register Implementation
* Forwarding Unit for Data Hazard Resolution
* Hazard Detection Unit with Stall Generation
* Branch Control and Branch Comparator Logic
* Register File (32 × 32-bit)
* Arithmetic Logic Unit (ALU)
* Instruction Memory
* Data Memory
* RTL Schematic Generation
* Behavioral Simulation and Verification
* Scalable Architecture for Future RISC-V Extension

---

## Pipeline Architecture

The processor follows the classic 5-stage pipelined datapath:

```text
Instruction Fetch (IF)
        │
        ▼
Instruction Decode (ID)
        │
        ▼
Execute (EX)
        │
        ▼
Memory Access (MEM)
        │
        ▼
Write Back (WB)
```

### IF – Instruction Fetch

* Fetches instructions from Instruction Memory.
* Updates Program Counter (PC).
* Passes fetched instruction to IF/ID pipeline register.

### ID – Instruction Decode

* Decodes instruction fields.
* Reads source operands from Register File.
* Generates processor control signals.
* Sign-extends immediate values.

### EX – Execute

* Performs arithmetic and logical operations.
* Calculates branch targets.
* Executes forwarding logic to resolve data hazards.

### MEM – Memory Access

* Performs memory read and write operations.
* Handles branch decision processing.

### WB – Write Back

* Writes ALU or memory results back into the Register File.

---

## Implemented Modules

### Core Datapath Modules

| Module               | Description           |
| -------------------- | --------------------- |
| PC.v                 | Program Counter       |
| Instruction_Memory.v | Instruction Storage   |
| register_file.v      | Register File         |
| control_unit.v       | Main Control Unit     |
| ALU_Control.v        | ALU Operation Decoder |
| aluu.v               | Arithmetic Logic Unit |
| DataMemory.v         | Data Memory           |

### Pipeline Registers

| Module   | Purpose           |
| -------- | ----------------- |
| IF_ID.v  | IF → ID Register  |
| ID_EX.v  | ID → EX Register  |
| EX_MEM.v | EX → MEM Register |
| MEM_WB.v | MEM → WB Register |

### Hazard Management

| Module             | Purpose                   |
| ------------------ | ------------------------- |
| ForwardingUnit.v   | Data Forwarding           |
| Hazard_Detection.v | Load-Use Hazard Detection |

### Branch Handling

| Module              | Purpose               |
| ------------------- | --------------------- |
| BranchControl.v     | Branch Decision Logic |
| Branch_Comparator.v | Operand Comparison    |

### Top-Level Integration

| Module               | Purpose                        |
| -------------------- | ------------------------------ |
| Pipeline_Processor.v | Complete Processor Integration |

---

## Supported Instructions

### Arithmetic & Logical Operations

* ADD
* SUB
* AND
* OR
* XOR

### Memory Operations

* LOAD
* STORE

### Control Operations

* Branch Instructions

---

## Hazard Resolution Techniques

### Forwarding Unit

The forwarding unit minimizes pipeline stalls by forwarding computed results from later pipeline stages directly to the Execute stage.

**Benefits:**

* Reduces data dependency delays
* Improves instruction throughput
* Minimizes unnecessary stalls

### Hazard Detection Unit

Detects load-use hazards and inserts pipeline stalls when forwarding alone cannot resolve dependencies.

**Functions:**

* Hazard identification
* Stall generation
* Pipeline synchronization

### Branch Handling

The processor includes branch comparison and control logic to maintain correct program execution flow during branch instructions.

---

## RTL Architecture

The complete processor RTL architecture was generated and verified using Vivado RTL Analysis.

**Architecture Diagram:**

`Architecture/Pipeline_Architecture.png`

---

## Simulation & Verification

Behavioral simulation was performed using Vivado Simulator.

### Verified Functionalities

* Instruction Fetch Operation
* Instruction Decode Logic
* ALU Computation
* Register Read/Write Operations
* Memory Read/Write Access
* Pipeline Register Operation
* Data Forwarding
* Hazard Detection
* Pipeline Stalling
* Branch Execution
* Write-Back Functionality

### Simulation Results

Simulation waveforms demonstrate:

* Correct pipelined instruction execution
* Proper forwarding behavior
* Successful hazard resolution
* Correct branch handling
* Accurate memory operations

Simulation screenshots are available in:

```text
Simulation_Results/
```

---

## Project Structure

```text
32-bit-5-stage-pipelined-processor-verilog/
│
├── Source_Code/
│   ├── PC.v
│   ├── Instruction_Memory.v
│   ├── register_file.v
│   ├── control_unit.v
│   ├── ALU_Control.v
│   ├── aluu.v
│   ├── DataMemory.v
│   ├── IF_ID.v
│   ├── ID_EX.v
│   ├── EX_MEM.v
│   ├── MEM_WB.v
│   ├── ForwardingUnit.v
│   ├── Hazard_Detection.v
│   ├── BranchControl.v
│   ├── Branch_Comparator.v
│   └── Pipeline_Processor.v
│
├── Testbench/
│   └── Pipeline_Processor_tb.v
│
├── Architecture/
│   └── Pipeline_Architecture.png
│
├── RTL_Schematic/
│   └── RTL_Schematic.png
│
├── Simulation_Results/
│   ├── Pipeline_Waveform_1.png
│   ├── Pipeline_Waveform_2.png
│   └── Pipeline_Waveform_3.png
│
└── README.md
```

---

## Tools & Technologies

* Verilog HDL
* Xilinx Vivado Design Suite
* Vivado Simulator
* RTL Schematic Viewer
* Digital Logic Design
* Computer Architecture
* Pipeline Processor Design

---

## Learning Outcomes

This project provided hands-on experience in:

* Processor Datapath Design
* Pipeline Architecture
* Pipeline Register Design
* Data Hazard Resolution
* Forwarding Logic Implementation
* Hazard Detection Mechanisms
* Branch Control Techniques
* RTL Design and Verification
* Functional Simulation and Debugging
* Computer Architecture Fundamentals

---

## Future Enhancements

* Full RISC-V ISA Implementation
* Branch Prediction Unit
* Cache Memory Integration
* Dynamic Hazard Resolution
* Out-of-Order Execution
* Superscalar Pipeline Design
* FPGA Deployment and Validation

---

## Author

**Bellam Udaya Sree**
B.Tech – Electronics & Communication Engineering
JNTUA College of Engineering, Ananthapuramu

### Connect With Me

* GitHub: https://github.com/udayasree-vlsi
* LinkedIn: https://www.linkedin.com/in/udaya-sree-4b00a1304

---

## Project Status

✅ Completed
✅ Successfully Simulated
✅ RTL Verified
✅ Hazard Detection Verified
✅ Forwarding Unit Verified
✅ Branch Handling Verified
✅ Uploaded to GitHub

### Next Project

🚀 **32-Bit 5-Stage Pipelined RISC-V Processor**
