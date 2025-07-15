# 6-Bit ALU and FSM Controller Design with Verilog

## Project Overview
This repository contains the implementation of a 6-bit ALU and Finite State Machine (FSM) controller designed for the CSE 4207 CT 4 Assignment (Roll No: 1903113). The project is implemented using Verilog and synthesized with the 130nm Skywater PDK using the OpenLane toolchain. It includes a top-level circuit where an FSM (with states START, ONE, TWO, THREE, and FINISH) controls data inputs to an ALU supporting ADD, OR, XOR, and AND operations. The design includes testbenches, synthesis results, RTL floorplan, power analysis, GDS, and heatmap, along with a demonstration video.

## Assignment Requirements
The project adheres to the following specifications from the CSE 4207 CT 4 Assignment:
- **Word Size**: 6 bits
- **ALU Operations**: ADD, OR, XOR, AND
- **FSM States**: START (initial), ONE, TWO, THREE, FINISH (final)
- **Outputs**: ALU result and a flag indicating if the result is greater than input `a`
- **Synthesis**: Performed using 130nm Skywater PDK with OpenLane toolchain
- **Deliverables**:
  - Verilog modules for ALU, FSM controller, and top-level circuit
  - Testbenches for ALU, controller, and top-level module
  - RTL synthesis results, floorplan, power analysis, GDS, and heatmap
  - Demonstration video showcasing functionality

## Repository Contents
This repository includes the following components:
1. **Verilog Files**:
   - `alu_op1.v`: Implements ADD operation
   - `alu_op2.v`: Implements OR, XOR, AND operations
   - `controller.v`: FSM controller with states START, ONE, TWO, THREE, FINISH
   - `top.v`: Top-level module integrating ALU and FSM
   - `alu_tb.v`: Testbench for ALU
   - `controller_tb.v`: Testbench for FSM controller
   - `top_tb.v`: Testbench for top-level module
2. **Synthesis Results**:
   - RTL synthesis summary (`post_diff.rpt`, `stat.rpt`)
   - Synthesized design figures (`primitive_techmap.dot`, `hierarchy.dot`)
   - Standard cell usage table
   - RTL floorplan, power analysis, GDS, and heatmap
3. **Documentation**:
   - Assignment documentation (`19C4TAssignment_doc_1903113.pdf`)
   - Demonstration video (`19C4TAssignment_video_1903113.mp4`) hosted on Google Drive
4. **Timing Diagrams**:
   - Included for `alu_tb.v`, `controller_tb.v`, and `top_tb.v` to verify functionality

## Tools Used
- **Verilog**: For designing ALU, FSM, and top-level modules
- **OpenLane Toolchain**: For RTL synthesis with 130nm Skywater PDK
- **xdot**: For visualizing synthesized design (`xdot primitive_techmap.dot`, `xdot hierarchy.dot`)
- **Zoom**: For recording the demonstration video
- **Google Drive**: For hosting the demonstration video

## How to Run the Project
1. **Setup Environment**:
   - Install a Verilog simulator (e.g., Icarus Verilog or ModelSim).
   - Install the OpenLane toolchain for synthesis with 130nm Skywater PDK.
   - Install `xdot` for viewing synthesized design figures.
2. **Run Simulations**:
   - Clone this repository to your local machine.
   - Simulate the testbenches (`alu_tb.v`, `controller_tb.v`, `top_tb.v`) using a Verilog simulator to verify functionality.
   - Check the timing diagrams generated from the testbenches.
3. **View Synthesis Results**:
   - Navigate to the synthesis folder and use `xdot primitive_techmap.dot` and `xdot hierarchy.dot` to view the synthesized design.
   - Review `post_diff.rpt` and `stat.rpt` for synthesis metrics (e.g., number of wires, ports, cells).
   - Check RTL floorplan, power analysis, GDS, and heatmap in the respective folders.
4. **View Demonstration Video**:
   - Access the video via the Google Drive link provided in the assignment documentation.
   - The video demonstrates the design using testbenches and shows synthesis results, including RTL synthesis, floorplan, power analysis, GDS, and heatmap.

## Checklist Compliance
The project meets the assignment requirements as per the provided checklist:
- **Video**: Uploaded to Google Drive, explaining the design with testbenches and showing synthesis results (Check List 1 & 2 satisfied).
- **Documentation**: Submitted as `19C4TAssignment_doc_1903113.pdf` with all required information.
- **Testbenches**: Included for ALU, controller, and top-level module, with timing diagrams.
- **Synthesis**: Includes RTL synthesis summary, synthesized design figures, and standard cell usage.
- **Power Analysis, GDS, and Heatmap**: Included as per assignment template requirements.
- **File Format**: All files are zipped using the default Windows `.zip` feature, avoiding `.exe`, `.rar`, or `.7z` formats.

## Notes
- Ensure Verilog files are compiled in the correct order to resolve module dependencies.
- The demonstration video is critical for verifying functionality and synthesis results.
- For synthesis, follow the video tutorials provided in the assignment for RTL floorplan, power analysis, GDS, and heatmap generation.
- Adhered to the academic honesty policy; all work is original and not shared.
- For any issues with file access or simulation, verify Google Drive permissions or contact the repository owner.

## License
This project is for educational purposes only and is part of the CSE 4207 CT 4 Assignment submission.
