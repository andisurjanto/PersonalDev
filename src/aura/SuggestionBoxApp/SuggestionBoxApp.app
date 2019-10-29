<aura:application >
    <ltng:require styles="/resource/slds/assets/styles/salesforce-lightning-design-system-ltng.css" />
    <div class="salesforce slds">
        <div class="slds-grid slds-wrap slds-grid--pull-padded">
            <div class="slds-col--padded slds-size--1-of-1 slds-medium-size--1-of-1 slds-large-size--1-of-6"></div>
            <div class="slds-col--padded slds-size--1-of-1 slds-medium-size--1-of-1 slds-large-size--4-of-6">
                <h3 class="slds-section-title--divider  slds-text-align--center textsize">SUGGESTION BOX APPLICATION</h3>
            </div>
            <div class="slds-col--padded slds-size--1-of-1 slds-medium-size--1-of-1 slds-large-size--1-of-6"></div>
            <div class="slds-col--padded slds-size--1-of-1 slds-medium-size--1-of-2 slds-large-size--1-of-6"></div>
            <div class="slds-col--padded slds-size--1-of-1 slds-medium-size--1-of-2 slds-large-size--4-of-6">
                <div class="slds-grid">
                    <div class="slds-col">
                       <c:SuggestionBoxCreate />
                       <c:SearchBar />
                    </div>
                </div>
                <div class="slds-grid slds-grid--pull-padded">
                    <div class="slds-col--padded">
                       <c:SuggestionList />
                    </div>
                    <div class="slds-col--padded">
                       <c:SuggestionDetails />
                    </div>
                </div>
            </div>
            <div class="slds-col--padded slds-size--1-of-1 slds-medium-size--1-of-2 slds-large-size--1-of-6"></div>
            <div class="slds-col--padded slds-size--1-of-1 slds-medium-size--1-of-1 slds-large-size--1-of-6"></div>
            <div class="slds-col--padded slds-size--1-of-1 slds-medium-size--1-of-1 slds-large-size--4-of-6">
                <h3 class="slds-section-title--divider  slds-text-align--center textsize">@created by Salesforce Developer Relations Team</h3>
            </div>
            <div class="slds-col--padded slds-size--1-of-1 slds-medium-size--1-of-1 slds-large-size--1-of-6"></div>
        </div>
    </div>
</aura:application>