# METHEREUM: Decentralized Blockchain Academic Profiles

DEMONHACKS: MAJOR LEAGUE HACKING SEASON 18

Inspiration:

Methereum will revolutionize the way every college, university and lender can provide financial aid and permanent records like transcripts and visas for students. For far too long, the financial aid institution has had a bureaucratic approach to accepting and processing loans, which takes weeks to months during processing and leaves the student at a severe disadvantage when making payments or applying to jobs.  To make matters worse, the onus resides on students to pay off their debt for each course before classes begin. Slow transactions of these sorts can cause students to become ineligible for class registration when holds are added to their accounts. Some students may also need a transcript or Visa to find a job: slow transactions also hamper students’ ability to complete applications in timely manners. Financial U (abbreviated as FineU) will use blockchain technology to make financial aid and permanent record transactions instant with encrypted records across all systems throughout the network due to its distributed ledger populated with smart contracts. FineU will also keep a record of each student’s transcript and Visa, if applicable, that can be distributed instantly.

Using solidity as a language with which to communicate with the ethereum network we created some smart contracts which will create a blockchain network of unique contracts. These contracts act as identiiers for both schools and students. By using blockchain technology there would no longer be a need for universities to keep an individual in house student record where they would now only edit the existing and unique contract attached to a student throughout their entire academic career. Transcripts, personal info, tuition, financial aid can all be accessed and managed through these contracts. This would not only make the process easy, but secure due to the unique address attached to the authorized schools and students. The time for a hold to be taken off will be reduced and tution or financial aid money transfers will become virtually instanteneus as there will be no ambiguity about the recipient nor sender of the money. 

Most importantly is the expandability of the project. This project is a proof of concept that it could work for academic processes a universal decentralized academic profile. But this could be expanded to include not only student loans but all types of loans. Identifying info as far as residency, and voting status. All of these will have the assurance that when dealing with a specific persons contract they are guaranteed to have the correct information reducing verification needs for government and private transactions of any form. In essence what we are saying is the project could be expanded to become a replacement for government identification. We can toss the outdated and useless SSN and replace it with a decentralized, secure, and unique identifying system using blockchain technology.

#The Code

SchoolRegistry.sol
This contract will act as the registry of schools, oinly a registered university will be allowed to have a contract and create student contracts. This contract is also a factory for school contracts, as any time a new school is registered they registry will create a unique contract for said school.

School.sol
This contract will have information about the university, it will also act as a factory where it can create a new contract for new students and change the university parent for existing students. The registry has priviliges in the contract where they can assign the owner address for the school.

Student.sol
This contract is the most important. It has the students information including financial aid, transcripts, tuition and open to expansion of any other sort of action that may be taken with a university. The university as privilages which allow it to edit certain things like tution and transcripts as well as granting viewing access tocertain addresses such as an employer requesting to view a transcritp. The student of course is granted access to view his information and is able to make payments for his tuiton directly to the university.

Using these three contract files they can be published into etherium or qtum thus creating the decentralized academic profile or as we call it MEthereum.

*
FU_Web_Prototype holds our front end html
