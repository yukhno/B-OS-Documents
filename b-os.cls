\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{b-os}
   [2023/03/16 v1.0
    B-OS, Unipessoal Lda. documents class]

\LoadClass[a4paper,11pt]{extarticle}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%%\RequirePackage{extsizes}

\RequirePackage{geometry}
\geometry{top=2cm}
\geometry{left=2cm}
\geometry{right=2cm}
\geometry{bottom=2cm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Meta Programming Macro
%%

%% \mkField{NNN}{0}
%%      =>  \def\theNNN{0}
%%          \def\NNN#1{\def\theNNN{#1}}
%%      \theNNN              %% => 0
%%      \NNN{zero} \theNNN   %% => zero
%%
\newcommand{\mkField}[2]{%
  \expandafter\def\csname the#1\endcsname{#2}%
  \expandafter\def\csname #1\endcsname##1{\expandafter\def\csname the#1\endcsname{##1}}}


\newcommand{\mkClauseSection}[3]{%
  \mkField{Before#1}{}
  \mkField{After#1}{}
  \expandafter\def\csname #1\endcsname{%
    \expandafter\csname theBefore#1\endcsname
    \Clause{#2}
      #3
    \expandafter\csname theAfter#1\endcsname
}}


%%
%% Disable Hyphenation
%%
\renewcommand{\familydefault}{\sfdefault}
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Define Fields of Document
%%

\mkField{ContractNumber}{SC-<YYY><MM><n>}
\mkField{ContractDate}{<DD> <MMMMM> <YYYY>}


\mkField{FCName}{B-OS,\,UNIPESSOAL\,-\,LDA}
\mkField{FCWhereRegistration}{the Commercial Registry of Madeira}
\mkField{FCTaxNo}{No.\,517120046 (NIPC)}
\mkField{FCAddress}{Startup Madeira, EV~176~- Campus da Penteada,
  9020-105 São~Roque, Funchal, Portugal}
\mkField{FCRepPersonPost}{the Director}
\mkField{FCRepPersonName}{Yevhen Yukhno}


\mkField{SCName}{[Second Contractor :: Company Name]}
\mkField{SCWhereRegistration}{[Second Contractor :: Where Registration]}
\mkField{SCTaxNo}{[Second Contractor :: Tax No.]}
\mkField{SCAddress}{[Second Contractor :: Address]}
\mkField{SCRepPersonPost}{[Second Contractor :: RepPerson Post]}
\mkField{SCRepPersonName}{[Second Contractor :: RepPersond Full Name]}


\edef\FC{First~Contractor}
\edef\SC{Second~Contractor}
\edef\Parties{Parties}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Define Styles Items of Document
%%

\newcounter{AnnexNo}
\setcounter{AnnexNo}{0}
\newcounter{cClause}
\setcounter{cClause}{0}
\newcounter{ccPoint}
\setcounter{ccPoint}{0}
\newcounter{ccPointLi}
\setcounter{ccPointLi}{0}

\newcommand{\ContractTitle}[1]{\noindent\textbf{\centerline{\Large #1}}}
\newcommand{\ContractSubTitle}[1]{\noindent{\centering#1}\vskip 2ex}
\newcommand{\EnglishWords}[1]{%
  \ifcase\value{#1}
    Zero \or One \or Two \or Three \or Four \or Five
    \or Six \or Seven \or Eight \or Nine \or Ten
    \or Eleven \or Twelve \or Thirteen \or Fourteen \or Fifteen
    \or Sixteen \or Seventeen \or Eighteen \or Nineteen \or Twenty
  \else \Roman{#1}
  \fi
}

\newcommand{\ContractSection}[1]{%%
  \ContractTitle{SERVICE CONTRACT}
  \ContractSubTitle{#1 \\ Nº\,\theContractNumber\par}
}

\newcommand{\AnnexSection}[1]{%%
  \newpage
  \stepcounter{AnnexNo}
  \ContractTitle{ANNEX \Alph{AnnexNo}.} 
  \ContractSubTitle{#1 \\ Nº\,\theContractNumber~dated~\theContractDate\par}
}

\newcommand{\Clause}[1]{%
  \stepcounter{cClause}
  \vskip1.5\baselineskip
  {\noindent\centering\textbf{\large \textsc{Clause} \EnglishWords{cClause}} \\ \textsc{#1} \\ }
  \setcounter{ccPoint}{0}
  \setcounter{ccPointLi}{0}
  \vskip0.7\baselineskip}

\newlength{\ccLabelLen}
\newlength{\ccLL}
\newlength{\ccLLL}

\newcommand{\CPoint}[1]{%
  \stepcounter{ccPoint}
  \setlength{\parskip}{1ex}
  \def\ccLabel{\arabic{cClause}.\arabic{ccPoint}.~}
  \settowidth{\ccLabelLen}{\ccLabel}
  \setcounter{ccPointLi}{0}
  \setlength{\leftskip}{\ccLabelLen}
  \setlength{\parindent}{-1\ccLabelLen}
  \ccLabel#1 \par
  \setlength{\leftskip}{0cm}
  \setlength{\parindent}{0cm}}

\newcommand{\CPointLi}[1]{%
  \stepcounter{ccPointLi}
  \def\ccPL{\alph{ccPointLi})~}
  \settowidth{\ccLL}{\ccPL}
  \setlength{\ccLLL}{\ccLL}
  \addtolength{\ccLLL}{\ccLabelLen}
  \setlength{\leftskip}{\ccLLL}
  \setlength{\parindent}{-1\ccLL}
  \ccPL#1 \par
  \setlength{\leftskip}{0cm}
  \setlength{\parindent}{0cm}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Scope of Serivce
%
\mkField{CPointItems}{%% The First Contractor shall provide Service as follows:
  \CPointLi{business process description, optimization, and reorganization;}
  \CPointLi{IT consulting on automation of main business processes;}
  \CPointLi{IT consulting on choosing a managerial accounting information system;}
  \CPointLi{trust management of the information system implementation project.}
}

\mkClauseSection{ScopeOfService}{Scope of Services}{%% Clause One
    \CPoint{%% 1.1.
      The \FC shall provide Service for the \SC as follows: \par
      \theCPointItems
    }
    \CPoint{%% 1.2.
      The Services to be provided by the First Contractor shall be described in the
      Statement of Work attached hereto as Annex A.
    }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Term of Contract
%
\mkClauseSection{TermOfContract}{Term of Contract}{%% Clause Two
    \CPoint{%% 2.1.
      This Contract shall commence on the date of signing by both parties and shall
      continue until the completion of the Services.
    }
    \CPoint{%% 2.2.
      This Contract may be terminated ahead of schedule at the request of either
      Party upon written notice to the other Party within a period not less than
      15 (fifteen) calendar days prior to the date of such termination. The Party
      which received such notice about the termination of the Contract over the
      next 15 (fifteen) days has to do specific actions aimed at the completion of
      its obligations under the Contract, including but not limited to, the following:
      completion of the Services, submition of the developed software and/or
      results of services rendered, accomplish payments reconciliation,
      make the final payment, etc.
    }
    \CPoint{%% 2.3.
      The work breakdown structure and estimated deadlines for their completion
      are given in Annex~A.
    }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Responsibilities of the Parties
%
\mkClauseSection{Responsibilities}{Responsibilities of the Parties}{%% Clause Three
    \CPoint{%% 3.1.
      The \FC shall perform the Services in a professional and
      workmanlike manner, using its best efforts, skill, and judgment.
    }
    \CPoint{%% 3.2.
      The \SC shall provide the \FC with
      all necessary information, documents, and access to resources
      that may be required to perform the Services specified in this Contract.
    }
    \CPoint{%% 3.3.
      The \FC shall define the work breakdown structure, schedule of
      meetings, and other activities for the \Parties, and estimate the costs and
      necessary effort for success.
    }
    \CPoint{%% 3.4.
      The \FC shall create and periodically update the statement of
      work document for the \SC's approval
    }
    \CPoint{%% 3.5.
      The Second Contractor shall timely pay the First Contractor for
      the Services provided under this Contract according to the received invoice
    }
    \CPoint{%% 3.6.
      The \FC shall provide the \SC with reliable information on the status of
      work, and promptly inform the Second Contractor about all changes that
      may affect the timing of the work and the quality of the results.
    }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Compensation
%
\mkClauseSection{Compensation}{Compensation}{%% Clause Four
    \CPoint{%% 4.1.
      The \FC shall invoice the \SC for the Services provided under
      this Contract as compensation for the actual work, time spent,
      and used material in accordance with the Statement of Work
      set forth in Annex~A.
    }
    \CPoint{%% 4.2.
      In case of termination of the Contract, the \SC shall pay for materials
      and work performed by the Contractor until the termination of the contract.
    }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Force Majeure
%
\mkClauseSection{ForceMajeure}{Force Majeure}{%% Clause Five
    \CPoint{%% 5.1.
      Neither party shall be liable for any failure or delay in performance of
      its obligations under this Contract if such failure or delay is caused
      by circumstances beyond its reasonable control, including, but
      not limited to, acts of God, war, civil unrest, strikes, labor disputes,
      embargoes, government orders or regulations, floods, fires, or
      other natural disasters (“Force Majeure Event”).
    }
    \CPoint{%% 5.2. 
      The party affected by a Force Majeure Event shall promptly notify
      the other party in writing and shall use its best efforts to mitigate
      the impact of the Force Majeure Event on its performance under this Contract.
    }
}
         

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Confidentiality
%
\mkClauseSection{Confidentiality}{Confidentiality}{%% Clause Six
    \CPoint{%% 6.1.
      The parties acknowledge that during the course of performing
      the Services, each party may have access to and acquire
      certain confidential, proprietary, financial, technical,
      software, and other information that may be used
      for commercial advantage.
    }
    \CPoint{%% 6.2.
      Each party agrees to use the other party's confidential information
      only for the purpose of performing the Services under this Contract.
    }
    \CPoint{%% 6.3.
      Each party agrees to keep confidential all such information,
      to protect it against disclosure, misuse, or unauthorized use,
      and to prevent it from falling into the hands of any
      unauthorized third party.
    }
    \CPoint{%% 6.4.
      Each party agrees not to disclose such information to any third party
      without the other party's prior written consent.
    }
    \CPoint{%% 6.5.
      Upon termination or expiration of this Contract, each party shall return
      or destroy all confidential information received from the other party.
    }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Liability
%
\mkClauseSection{Liability}{Liability}{%%  Clause Seven
     \CPoint{%% 7.1.
       Each party shall be responsible for its own actions in performing
       this Contract.
     }
     \CPoint{%% 7.2.
       The First Contractor shall be liable to the Second Contractor only
       for direct damages arising out of or in connection with the \FC’s
       breach of this Contract, provided that such damages shall not exceed
       the amount paid by the \SC to the \FC under this Contract.
     }
     \CPoint{%% 7.3.
       In no event shall either party be liable for any indirect, special,
       incidental, or consequential damages arising out of or in connection with
       this Contract, including, but not limited to, lost profits or
       business interruption, even if such damages were foreseeable or
       if the party had been advised of the possibility of such damages.
     }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Intellectual Property
%
\mkClauseSection{IP}{Intellectual Property}{%%  Clause Eight
    \CPoint{%% 8.1.
      All intellectual property rights in any work product created by
      the \FC under this Contract shall belong to the \SC.
    }
    \CPoint{%% 8.2.
      The \FC shall retain no rights or interest in any such work product.
    }
    \CPoint{%% 8.3.
      The \FC shall not use any confidential information or intellectual property
      of the \SC except as necessary to perform the Services under this Contract.
    }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Governing Law and Dispute Resolution
%
\mkClauseSection{Dispute}{Governing Law and Dispute Resolution}{%% Clause Nine
    \CPoint{%% 9.1.
      This Contract shall be governed by and construed in accordance with
      the laws of [Country of Arbitration].
    }
    \CPoint{%% 9.2.
      Any disputes arising out of or in connection with this Contract
      shall be resolved by arbitration in accordance with the rules of
      the International Chamber of Commerce, and judgment upon the award
      rendered by the arbitrator(s) may be entered in any court having
      jurisdiction thereof.
    }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Miscellaneous
%
\mkClauseSection{Miscellaneous}{Miscellaneous}{%% Clause Ten
    \CPoint{%% 10.1.
      This Contract may not be assigned or transferred by either party without
      the prior written consent of the other party.
    }
    \CPoint{%% 10.2.
      This Contract is made in 2 (two) copies in English, each of which
      shall be deemed an original, and all of which together shall constitute
      one and the same instrument. Both documents are of equal legal force.
    }
    \CPoint{%% 10.3.
      This Contract constitutes the entire agreement between the parties and
      supersedes all prior negotiations, agreements, correspondence, and
      understandings, whether written or oral, relating to the subject matter of
      this Contract.
    }
    \CPoint{%% 10.4.
      This Contract shall be binding upon and inure to the benefit of
      the Parties and their respective successors and assigns.
    }
    \CPoint{%% 10.5.
      This Contract may not be amended or modified except in writing executed
      by both parties.
    }
}





\newcommand{\MakeDocument}{%
  \begin{document}
    \fontfamily{phv}\selectfont
    \ContractSection{%%
      of professional services on business process optimization, \\
      business informatization and trust project management %% + Nº SC-023031
    }

    \noindent The \theFCName, with the unique number of legal person and
    registration at \theFCWhereRegistration~\theFCTaxNo, headquartered at
    \theFCAddress, represented by \theFCRepPersonPost, \theFCRepPersonName,
    with sufficient powers for the hereinafter designated as the <<\FC>>; and
    \vskip 1ex
    \noindent The \theSCName, with the unique number of legal person and
    registration at \theSCWhereRegistration~\theSCTaxNo, headquartered at
    \theSCAddress, represented by \theSCRepPersonPost, \theSCRepPersonName,
    with sufficient powers for the hereinafter designated as the <<\SC>>,
    hereinafter referred to collectively as the <<\Parties>>, have agreed as folows:

    \ScopeOfService
    \TermOfContract
    \Responsibilities
    \Compensation
    \ForceMajeure
    \Confidentiality
    \Liability
    \IP
    \Dispute
    \Miscellaneous
%    \AnnexSection
  \end{document}
}



\endinput
