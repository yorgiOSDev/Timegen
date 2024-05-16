import 'package:flutter/material.dart';
import 'package:flutter_template/router/route_utils.dart';
import 'package:flutter_template/utils/responsive/responsive_layout.dart';
import 'package:flutter_template/widgets/app_bar_widget.dart';
import 'package:flutter_template/widgets/drawer_widget.dart';
import 'package:flutter_template/widgets/routine_widget.dart';

class RoutinesScreen extends StatelessWidget {
  const RoutinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.routines.toTitle),
      drawer: !ResponsiveLayout.isDesktop(context) ? const DrawerWidget() : null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoutineWidget(
                title: 'Asbestos Handling Routine', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for this routine being carefully followed. \nAll employees are obligated to adhere to the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine has been established to ensure that personnel and the environment are not exposed to asbestos dust, and that all asbestos remediation is conducted in accordance with applicable legal requirements by certified personnel.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Survey during Inspection/Tender: \nDuring an inspection or tender process, it should be assessed whether planned work may result in exposure to asbestos-containing materials. \nSurvey at Project Start: \nAt the start of projects, the project manager (construction manager/supervisor/foreman) must ensure that the survey carried out is sufficient, and if necessary, conduct a new survey. \nEngagement of Specialized Firm: \nUpon discovery or suspicion of asbestos-containing materials, firms with special permission to handle asbestos should be engaged for further investigations. Approved firms can be found on the Labour Inspection Authority\'s website. \nCaution in Areas with Asbestos: \nEmployees should work cautiously in areas where there is a risk of asbestos and avoid stirring up asbestos fibers. \nHealth Examinations: \nIn case of suspicion of exposure to asbestos dust among employees, the need for a health examination should be considered. \nFollow Guidelines during Remediation: \nWhen remediation companies are engaged, their guidelines must be followed strictly. \nSubmission of Permits and Notifications: \nThe daily manager must ensure that all necessary permits and notifications are submitted in connection with asbestos work. \nPersonal Protective Equipment: \nApproved respiratory masks. \nGloves. \nSafety Equipment: \nBarrier tapes as needed. \nResponsibility for Deviations: \nDeviations from this routine are at the user\'s own risk. \nThis routine emphasizes the importance of caution and proper handling when working with or near asbestos-containing materials to protect both employees and the environment from the hazardous effects of asbestos exposure.'
                
              ),
              RoutineWidget(
                title: 'Routine for Work on or Near Busy Roads', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for the adherence to this routine. \nAll employees are committed to follow the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine has been established to ensure that all rules for work on or near busy roads are carefully followed, with the aim of preventing injuries to personnel and damage to equipment.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Training and Traffic Control Courses: \nPersonnel who prepare applications and sign plans must have completed the necessary training and Traffic Control Course 2. \nEveryone performing work on public roads must have undergone the necessary training and Traffic Control Course 1. \nNotification and Sign Plan: \nResponsible personnel must ensure that notification according to the approved sign plan is set up before work begins. \nWork Description and Risk Assessment: \nA detailed work description and risk assessment must be prepared before work commences. \nUse of Clothing and Warning Equipment: \nApproved work clothing with reflectors and signal color is mandatory. \nFlashing lights must be used when enhanced warning is needed. \nTraffic Management: \nThe need for traffic management should be regularly assessed. Personnel performing traffic management must have completed Traffic Control Course 3. \nSafety for Vulnerable Road Users: \nMeasures should be implemented to keep vulnerable road users out of the work area. \nPersonal Protective Equipment: \nApproved clothing with reflectors and signal color. \nSafety Equipment: \nSigns, warning lights, barrier equipment, and communication equipment should be used as needed. \nResponsibility in Case of Deviation: \nAny deviations from this routine occur at the individual user\'s own risk. \nBy following this routine, we contribute to a safe workplace for both our employees and for road users in the area where the work is performed.'
                
              ),
              RoutineWidget(
                title: 'Routine for Safety in Working at Heights', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for ensuring the routine is followed. \nAll employees are required to adhere to the routine. \nThe scaffolding responsible is in charge of ensuring the scaffold is in regulatory condition and is the only person to assemble, alter, or dismantle the scaffolding.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine is established to ensure that rules for working at heights are observed, to prevent injuries to personnel and equipment. Primarily, scaffolding should be used for work at heights, while ladders should be used only exceptionally and not as a permanent workstation. \nMeasures: \nOpenings in floors must be secured with covering or railings, clearly marked and dimensioned for the area\'s activity. \nSafety measures must prevent falls of persons and loose objects, as well as tipping and tripping hazards. \nIt is strictly prohibited to remove safety measures without immediately implementing new ones. \nFall prevention equipment such as extra barriers must be used when working at significant heights. \nFall protection equipment is only to be used for short-term work where other safety measures are not possible.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Ladder: \nMust be stable and placed on even ground, secured against sliding. \nThe user must have a secure grip and stand firm. \nLadders for access must extend a minimum of 1 meter above the landing and be secured at the top. \nLift: \nUsers must have documented training. \nCheck the bearing capacity of the ground before use. \nThe lift must be level, and operators are responsible for daily inspections. \nWhen working near other personnel, the work area must be cordoned off. \nWeight limitations and safety regulations, including caution around live wires, must be respected. \nSafety harnesses are always recommended to be attached to the platform. \nScaffolding: \nNecessary training in the use of scaffolding is required. \nThe scaffolding must be marked with scaffolding signs and kept tidy. \nOnly approved accesses should be used. \nMobile Scaffolding: \nChecked before use for proper assembly and locking of wheels. \nNo one should be on the scaffolding during movement. \nPersonal Protective Equipment: \nHelmet, gloves, and safety footwear as needed. \nSafety Equipment: \nSafety harness and fall protection equipment as needed. \nResponsibility in Case of Deviation: \nDeviations from this routine are at the user\'s own risk. \nBy following this routine, a safe work method for working at heights is ensured, emphasizing the prevention of accidents and injuries.'
                
              ),
              RoutineWidget(
                title: 'Routine for Handling Vibrations from Work Equipment', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for implementing and monitoring this routine. \nAll employees are obligated to comply with the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine addresses mechanical vibrations transferred from work equipment to the hand and arm, which can occur with the use of equipment such as grinders, chainsaws, drills, chisel machines, and similar. The goal is to minimize exposure to vibrations and thus reduce the risk of injuries.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Survey and Documentation: \nThe employer must survey and document the degree of vibration exposure from work equipment, and identify when action and limit values are exceeded. \nThe action value for vibrations is set to 2.5 m/s² and the limit value to 5.0 m/s² over an 8-hour working day (A(8)). \nReduction of Exposure: \nChoose low-vibration work equipment where possible. \nLimit exposure time for workers using vibrating equipment. \nConsider alternative methods and/or tools to reduce the necessity of vibrating equipment. \nAvoid the use of unnecessary force when using the equipment. \nUse vibration-damping gloves to reduce the transmission of vibrations. \nEnsure that work equipment is well maintained to minimize vibrations. \nHealth Examinations: \nProvide health examinations to workers who are regularly exposed to vibrations exceeding action values. \nPersonal Protective Equipment: \nVibration-damping gloves. \nHearing protection as needed, depending on the equipment\'s noise level. \nSafety Equipment: \nSafety equipment should be tailored based on specific job requirements and the nature of the work area. \nResponsibility in Case of Deviation: \nAny deviations from this routine are at the individual user\'s own risk. \nBy following this routine, we contribute to a safer working environment by reducing the risk of vibration-induced injuries.'
              ),
              RoutineWidget(
                title: 'Routine for HSE and Environmental Management', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for the implementation and compliance with this routine. \nAll workers are responsible for following the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine involves active efforts in leadership within waste and environmental management, as well as compliance with relevant HSE laws and regulations. It covers the working environment, procurement, material use, emissions to water, and aesthetics.', 
                procedure: 'General:', 
                procedureList: 
                  'Active work for leadership in waste and environmental management. \nUp-to-date knowledge of and compliance with relevant HSE laws and regulations. \nSetting goals for health, environment, and safety. \nAvailability of HSE data sheets and creation of a chemical inventory. \nFocus on planning and execution of work operations. \nWork Environment: \nConnection to an approved occupational health service according to regulations. \nAvailability of suitable and quality-assured protective equipment. \nRoutines for regular maintenance of tools and equipment. \nProcurement and Material Use: \nPreferred use of environmentally declared and eco-labeled building materials in procurement. \nSelection of materials and ventilation solutions that contribute to a good indoor climate, long durability, and recycling possibilities. \nPrioritization of environmentally friendly energy carriers and low energy consumption for buildings. \nEmissions to Water: \nUse of eco-labeled detergents (Swan, EU Flower, Good Environmental Choice, or equivalent) as far as possible. \nAesthetics: \nMaintenance of tidiness at the construction site. \nResponsibility in Case of Deviation: \nAny deviations from this routine occur at the individual user\'s own risk. \nBy following this routine, we ensure that our business not only meets but leads the industry in waste and environmental management, while maintaining a safe and healthy work environment.'
              ),            
              RoutineWidget(
                title: 'Routine for Safe Use of Table Saws', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for ensuring this routine is followed. \nAll employees commit to adhering to the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine is established to ensure that all necessary rules for using table saws are followed, aiming to prevent injuries to personnel and equipment.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Training: \nThe employer must ensure that all users have received the necessary training before using the table saw. \nProtective and Safety Equipment: \nBoth the employer and the worker must ensure that all protective and safety equipment is correctly fitted, adjusted, and maintained. \nRepairs and Maintenance: \nOnly competent personnel may perform repairs and maintenance on the saw. \nUse of Riving Knife and Guard: \nA riving knife and guard must always be correctly mounted on the saw. \nUse of Push Sticks: \nPush sticks must always be available and used to promote safe use. \nEmergency Stop Function: \nThe saw must not be used if the emergency stop function does not work properly. \nDust Extraction for Indoor Use: \nWhen using the saw indoors, dust extraction must be used to efficiently handle dust and chips. \nTidiness:  \nThe area around the saw should be cleared after use to prevent tripping and other hazards. \nThe saw should be cleaned after the end of the workday. \nPower Connection: \nDisconnect the power at the end of the workday. Lock the saw if needed for further security. \nPersonal Protective Equipment: \nHearing protection to protect against noise.vSafety glasses to protect eyes from chips and dust. \nDust mask is recommended to prevent inhalation of dust. \nSafety Equipment: \nPush sticks to keep hands safely away from the blade. \nResponsibility in Case of Deviation: \nAny deviations from this routine are at the individual user\'s own risk.  \nFollowing this routine ensures a safe workplace and helps prevent accidents and injuries when using a table saw.'
              ),
              RoutineWidget(
                title: 'Routine for Safe Use of Chemicals and Solvents', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for ensuring this routine is followed. \nAll employees are responsible for adhering to the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine is designed to ensure that all safety rules for the use of chemicals and solvents are followed, to prevent damage to equipment and personnel.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Equipment Inspection: \nCheck the angle grinder for faults and defects before use. \nEnsure the disc is correctly mounted and securely fastened. \nWork Area: \nRemove flammable material from the area around the place of use. \nPersonal Protective Equipment: \nA protective guard must always be mounted on the angle grinder. \nAlways use safety glasses or a visor as well as hearing protection. \nDo not use damaged discs. \nUse both hands when operating the tool for optimal control. \nPerform work that generates dust, preferably outdoors. \nAvoid braking the disc by applying pressure from the side.vEquipment Handling: \nUnplug the tool when changing the disc and after use. \nPersonal Protective Equipment: \nSafety glasses or visor for eye protection. \nHearing protection for noise protection. \nGloves for hand protection. \nDust mask for operations that generate dust. \nSafety Equipment: \nProtective guard for extra protection. \nApproved firefighting equipment available for use in emergencies. \nDeviation from Routine: \nDeviations from this routine are at the individual user\'s own risk. \nBy following this routine, we contribute to a safe work environment and prevent accidents and injuries when using angle grinders and cutters. Remember to also follow the routine for the performance of hot work.'
              ),
              RoutineWidget(
                title: 'Routine for the Use of Personal Protective Equipment (PPE)', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for implementing and adhering to this routine. \nAll employees are committed to following the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine is designed to ensure that all workers are familiar with and correctly use the issued personal protective equipment. The aim is to prevent injuries to personnel, equipment, and surroundings by following the measures described in the company\'s other HSE (Health, Safety, and Environment) routines.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Distribution and Training in PPE: \nThe employer must ensure that all workers receive relevant personal protective equipment and the necessary training in its use. \nSafety equipment and related training must also be provided by the employer. \nAll training must be documented to ensure the information has been given and understood. \nMandatory Use of PPE: \nPersonal protective equipment must be used in all situations where it is not possible to protect workers in other ways. \nSafety footwear is mandatory on all construction and building sites. \nIn projects, the strictest requirements for personal protective equipment always apply. \nWorkers are required to use the mandatory protective equipment and follow the company\'s HSE routines. \nPersonal Protective Equipment Includes: \nHelmet \nSafety footwear \nHearing protection \nWork clothing \nHigh-visibility clothing \nProtective masks/dust masks \nGloves \nSafety Equipment Includes: \nFall protection equipment \nSigns, warning devices, barrier tape, communication equipment \nResponsibility in Case of Deviation: \nAny deviations from this routine are at the individual user\'s own risk. \nFollowing this routine contributes to a safer working environment and ensures that workers are protected against potential hazards in the workplace.'
              ),
              RoutineWidget(
                title: 'Routine for the Use of Angle Grinders and Cutters', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for ensuring this routine is followed. \nAll employees are committed to following the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine ensures that rules for the safe use of angle grinders and cutters are followed to prevent injuries to personnel and equipment, as well as to meet the requirements for the performance of hot work. Users must possess a valid certificate for the performance of hot work on temporary work sites, with the necessary basic course reviewed every five years for renewal.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Equipment Inspection: \nCheck the angle grinder for faults and defects before use. \nEnsure the disc is correctly mounted and securely fastened. \nWork Area: \nRemove flammable material from the area around the place of use. \nPersonal Protective Equipment: \nA protective guard must always be mounted on the angle grinder. \nAlways use safety glasses or a visor as well as hearing protection. \nDo not use damaged discs. \nUse both hands when operating the tool for optimal control. \nPerform work that generates dust, preferably outdoors. \nAvoid braking the disc by applying pressure from the side. \nEquipment Handling: \nUnplug the tool when changing the disc and after use. \nPersonal Protective Equipment: \nSafety glasses or visor for eye protection. \nHearing protection for noise protection. \nGloves for hand protection. \nDust mask for operations that generate dust. \nSafety Equipment: \nProtective guard for extra protection. \nApproved firefighting equipment available for use in emergencies. \nDeviation from Routine: \nDeviations from this routine are at the individual user\'s own risk. \nBy following this routine, we contribute to a safe work environment and prevent accidents and injuries when using angle grinders and cutters. Remember to also follow the routine for the performance of hot work.'
              ),
              RoutineWidget(
                title: 'Routine for Safe Use of Vehicles', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for ensuring this routine is closely followed. \nAll employees are obligated to comply with the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine is established to ensure that all rules for the use of vehicles are followed to prevent damage to personnel, equipment, and the environment.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Certificates and Training: \nNecessary certificates and training must be in place for the user before driving commences. \nCondition of the Vehicle: \nThe user must ensure that the vehicle is in regulatory condition before use. \nAny faults or deficiencies must be immediately reported to the nearest manager. \nResponsible Driving: \nDriving must be conducted in a manner that does not discredit the company. \nViolations of traffic laws are considered personal offenses. The company does not cover fines or similar penalties. \nSafety Measures: \nEnsure there is clear visibility from the driver\'s seat. \nExercise special caution when reversing. \nAdjust driving to conditions to ensure safety. \nAvoid unnecessary idling. \nSeat Belts: \nSeat belts must always be used while driving. \nPersonal Protective Equipment: \nSeat belts are mandatory for everyone in the vehicle. \nSafety Equipment: \nThe safety equipment to be used will vary depending on the type and use of the vehicle. \nDeviation from the Routine: \nDeviations from this routine are at the individual user\'s own risk. \nFollowing this routine contributes to promoting a safe driving culture within the company and ensures that all necessary precautions are taken to protect both the employees and the environment.'
              ),
              RoutineWidget(
                title: 'Routine for Use, Safety, and Maintenance of Machines and Vehicles', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for ensuring this routine is followed. \nAll employees are obligated to adhere to the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'The purpose of this routine is to ensure that rules for the use, safety, and maintenance of the company\'s machines and vehicles are followed to prevent damage to personnel and equipment, as well as to ensure the operation and lifespan of the equipment..', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Use: \nThe employer must ensure that workers using machines and vehicles have received sufficient documented or certified training. \nWorkers must report any lack of training. \nThe use of machines and vehicles without the necessary approvals is not allowed. \nThe user must ensure that machines and vehicles are in regulatory condition before use. \nMachines and vehicles must only be used for their intended purpose. \nSafety: \nSafety instructions in the instruction manual or user manual for machines and vehicles must always be followed. \nSeat belts are mandatory when using vehicles. \nRules for the use of tachographs/logbooks in vehicles must be complied with. \nMaintenance: \nMaintenance instructions for the machine or equipment must be followed carefully. \nOnly qualified persons may perform maintenance and repairs. \nMaintenance must be logged in the maintenance log that accompanies the equipment. \nRegular cleaning and tidying of the equipment must be performed. \nPersonal Protective Equipment: \nSeat belts must be used where relevant. \nSafety Equipment: \nThe choice of safety equipment depends on the nature of the work. \nResponsibility in Case of Deviation: \nDeviations from this routine are at the individual user\'s own risk. \nBy following this routine, we contribute to a safe and efficient work environment, while ensuring that the company\'s machines and vehicles are in good and regulatory condition.'
              ),
              RoutineWidget(
                title: 'Routine for Inspection and Maintenance of First Aid Equipment', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for ensuring this routine is followed. \nAll employees have a duty to adhere to the routine.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine is designed to ensure that first aid equipment is regularly inspected to be complete and available. The equipment should be adapted to factors such as the size of the workplace, the number of workers, geographic location, and the nature of the work performed.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Availability and Completeness: \nEmployers must at all times ensure that first aid equipment is available and complete, adapted to the specific work situation. \nFirst aid equipment must be easily accessible in all premises, in the machinery park, and on project areas. \nTraining: \nIt is recommended to have an appropriate number of employees with the necessary training in first aid to provide immediate and effective help in case of accidents. \nInspection and Maintenance: \nRegular inspections should be performed to ensure that the first aid equipment is in good condition and that the contents are not expired. This can be done, for example, through regular safety rounds. \nThe equipment must be maintained, and any deficiencies or expired items must be replaced immediately. \nReporting of Deficiencies: \nAll workers have a responsibility to report any deficiencies in the first aid equipment to their immediate supervisor. \nDeviation from the Routine: \nDeviations from this routine are at the individual user\'s own risk. \nBy maintaining this routine, we ensure that all employees have access to the necessary first aid equipment in case of emergencies, which is crucial for providing quick and effective assistance.'
              ),
              RoutineWidget(
                title: 'Routine for Handling and Pollution in the Work Atmosphere', 
                responsible: 'Responsible:', 
                sentences: 'The daily manager is responsible for the implementation and compliance with this routine. \nAll employees have a duty to follow the routine to protect themselves, the equipment, and the environment from damage caused by pollution in the work atmosphere.', 
                description: 'Decription:', 
                descriptionsList: 
                'This routine is designed to ensure that all rules for handling and pollution in the work atmosphere are followed, with the goal of preventing damage to personnel, equipment, and the environment.', 
                procedure: 'Procedure:', 
                procedureList: 
                  'Survey and Documentation: \nThe employer must survey and document that the level of pollution in the work atmosphere is safe. \nTraining: \nThe employer must ensure that all workers receive necessary training on hazardous chemicals, correct use of the chemical inventory, work equipment, and protective measures. \nVentilation: \nWorkspaces and workplaces that may cause air pollution must be equipped with mechanical ventilation and process-adapted extraction. \nProtection Against Splashes and Spills:'
              ),
              RoutineWidget(
                title: 'Routine for Handling HSE Non-compliance', 
                responsible: 'Responsible:', 
                sentences: 'The CEO is primarily responsible for the adherence to this routine, to implement necessary measures, and to close non-compliances. \nProject managers are responsible for ensuring the routine is followed on a project basis. \nAll employees are obligated to report non-compliances.', 
                description: 'Decription:', 
                descriptionsList: 
                'Non-compliance refers to any lack of fulfillment of established requirements or routines. \nIt is the responsibility of all workers to report non-compliances. They must also familiarize themselves with and follow the measures implemented to promote learning and prevent recurrence of non-compliances. \nNon-compliances should be reported through the company’s or project\'s non-compliance management system. This can be by directly filling out a non-compliance form on an app/web or by notifying the CEO or the person responsible for non-compliance management.', 
                procedure: 'Registration:', 
                procedureList: 
                  'Each non-compliance should be registered as a unique case. A label can be assigned, and the non-compliance should be corrected and marked as closed on the spot where possible. \nIf the non-compliance cannot be immediately closed, it should be transferred to the non-compliance responsible or forwarded to other project participants for follow-up. \nThe CEO, non-compliance responsible, and participants are responsible for following up on reported non-compliances and ensuring they are properly dealt with and concluded. \nExamples of HSE non-compliances: \nNon-compliances identified during surveillance activities, such as construction meetings. \nObservations of hazardous conditions or situations. \nUndesirable incidents or near-misses. \nWork accidents resulting in personal injury or work-related diseases. \nNear-misses that could have led to injuries. \nChanges that are not in accordance with the Safety, Health, and Working Environment (SHA) plan. \nThis routine is designed to ensure a structured and effective approach to handling non-compliances within health, environment, and safety (HSE), emphasizing the importance of accountability and proactivity among all employees.'
              ),
            ],
          ),
        ),
      ),
    );
  }
}