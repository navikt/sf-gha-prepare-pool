# Prepare Scratch Pools

Github Action for preparing a pool.

Requires the `sfp` cli from Flxbl in order to run.

## Usage

<!-- Start usage -->
```yaml
- uses: navikt/sf-gha-prepare-pool@<tag/sha>
    with:
        # The alias of the Dev Hub org
        # Required: true
        dev-hub:
        
        # The path to sfdx-project.json
        # Required: false
        sfdx-project-path:
        
        # The key of the packages to install
        # Required: false
        package-key:
        
        # The path to the pool configuration file
        # Required: true
        pool-config-path:
```
<!-- end usage -->

## Henvendelser

Spørsmål knyttet til koden eller prosjektet kan stilles som issues her på GitHub.

## For NAV-ansatte

Interne henvendelser kan sendes via Slack i kanalen #platforce.
